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

exit:

	#print out exit message
	li $v0, 4
	la $a0, exitMessage
	syscall
	
	#exit the program
	li $v0, 10
	syscall
