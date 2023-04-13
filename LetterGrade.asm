#Names: Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Date: 04/16/23
#Objectives: Return a letter grade given Decimal int from user
# - includse user menu, main label, looping label, exit label
# - a way for user to continue getting letter grades or choose to exit
# - invalid input handling

.data 
menu: .asciiz "\n~~~~~~~~~~~~~~Main Menu~~~~~~~~~~~~~~\n(1)Get Letter Grade \n(2)Exit program \n"
menuChoice: .asciiz "\nEnter '1' or '2' for your selection: "
instruction: .asciiz "\nPlease enter a score as an integer value: "
returnScore: .asciiz "\nThe grade is: "
newScore: .asciiz "\n\nWould you like to enter a new score? \n (Y)Yes  (N)No \n"
newScoreSelection: .asciiz "\nEnter 'Y' or 'N' for your selection: "
exitMessage: .asciiz "\nThe program will now exit."

#buffer for yes or no loop
yesOrNo: .space 32

#Letter Grades:
a: .asciiz "A"
b: .asciiz "B"
c: .asciiz "C"
d: .asciiz "D"
f: .asciiz "F"
tryAgain: .asciiz "\nGrade cannot be below 0!"

.text
main:

Menu:
	#print out menu string
	li $v0, 4
	la $a0, menu
	syscall
	
	#print out menu choice
	li $v0, 4
	la $a0, menuChoice
	syscall
	
	li $v0, 5
	syscall
	move $t7, $v0
	
	#If one is picked move onto the integer input
	beq $t7, 1, Score
	
	#If two is picked then exit program
	beq $t7, 2, exit
	
	j Menu
Score:
	#print out instruction for integer input
	li $v0, 4
	la $a0, instruction
	syscall
	
	li $v0, 5
	syscall
	move $t6, $v0
	
	#loading grade values:
	li $t0, 90	#cutoff for A
	li $t1, 80	#cutoff for B
	li $t2, 70	#cutoff for C
	li $t3, 60	#cutoff for D
	li $t5, -1	#cutoff for valid input
	
	#bge -> branch on greater than or equal based on grade conditions:
	bge $t6, $t0, A		#if the grade is >= 90 branches to A
	bge $t6, $t1, B		#if the grade is >= 80 branches to B
	bge $t6, $t2, C		#if the grade is >= 70 branches to C
	bge $t6, $t3, D		#if the grade is >= 60 branches to D
	bge $t6, $zero, F	#if the grade is within 0-59 branches to F
	
	ble $t6, $t5, invalid	#if grade is below zero (invalid), branches to the menu
	
A: 
	#display letter grade 'A'
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, a
	syscall
	
	j moreGrade
	
B:
	
	#display letter grade 'B'
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, b
	syscall
	
	j moreGrade
C:
	#display letter grade 'C'
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, c
	syscall

	j moreGrade
D:

	#display letter grade 'D'
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, d
	syscall
	
	j moreGrade
	
F:
	#display letter grade 'F'
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, f
	syscall
	
	j moreGrade

invalid:

	#display message
	li $v0, 4
	la $a0, tryAgain
	syscall
	
	j moreGrade
	
moreGrade:
	#print out option for new score
	li $v0, 4
	la $a0, newScore
	syscall
	
	#print out new score selection
	li $v0, 4
	la $a0, newScoreSelection
	syscall
	
	#get selection
	li $v0, 8
	la $a0, yesOrNo
	li $a1, 2
	syscall

	lb $t5, 0($a0)
	
	#if Y/y is picked then move to Score
	beq $t5, 'Y', Score
	beq $t5, 'y', Score
	#if N/n is picked then move to Menu
	beq $t5, 'N', Menu
	beq $t5, 'n', Menu
	
	j moreGrade
exit:

	#print out exit message
	li $v0, 4
	la $a0, exitMessage
	syscall
	
	#exit the program
	li $v0, 10
	syscall
