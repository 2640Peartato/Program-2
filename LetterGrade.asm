#Names: Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Date: 04/16/23
#Objectives: Return a letter grade given Decimal int from user
# - includse user menu, main label, looping label, exit label
# - a way for user to continue getting letter grades or choose to exit
# - invalid input handling

.data 
menu: .asciiz "~~~~~~~~~~~~~~Main Menu~~~~~~~~~~~~~~\n(1)Get Letter Grade \n(2)Exit program \n"
menuChoice: .asciiz "\nEnter '1' or '2' for your selection: "
instruction: .asciiz "\nPlease enter a score as an integer value: "
returnScore: .asciiz "\nThe grade is: "
newScore: .asciiz "\nWould you like to enter a new score? \n (Y)Yes  (N)No"
newScoreSelection: .asciiz "\nEnter 'Y' or 'N' for your selection: "
exitMessage: .asciiz "\nThe program will now exit."

#Letter Grades:
a: .asciiz "A"
b: .asciiz "B"
c: .asciiz "C"
d: .asciiz "D"
f: .asciiz "F"

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
	
	#bge -> branch on greater than or equal based on grade conditions:
	bge $t6, $t0, A		#if the grade is >= 90 branches to A
	bge $t6, $t1, B		#if the grade is >= 80 branches to B
	bge $t6, $t2, C		#if the grade is >= 70 branches to C
	bge $t6, $t3, D		#if the grade is >= 60 branches to D
	
	j F	#jump to F if grade is lower than 60
	
A: 
	#display A grade:
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, a
	syscall
	
	j exit
	
B:
	
	#display A grade:
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, b
	syscall
	
	j exit
C:
	#display letter grade
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, c
	syscall

	j exit
D:

	#display letter grade
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, d
	syscall
	
	j exit
	
F:
	li $v0, 4
	la $a0, returnScore
	syscall
	
	li $v0, 4
	la $a0, f
	syscall
	
	j exit
	
exit:

	#print out exit message
	li $v0, 4
	la $a0, exitMessage
	syscall
	
	#exit the program
	li $v0, 10
	syscall
