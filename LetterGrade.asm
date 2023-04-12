#Names: Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Date: 04/16/23
#Objectives: Return a letter grade given Decimal int from user
# - includse user menu, main label, looping label, exit label
# - a way for user to continue getting letter grades or choose to exit
# - invalid input handling

.data 
menu: .asciiz "~~~~~~~~~~~~~~Main Menu~~~~~~~~~~~~~~\n(1)Get Letter Grade \n(2)Exit program \n"
menuChoice: .asciiz "\n Enter '1' or '2' for your selection: "
instruction: .asciiz "\n Please enter a score as an integer value: "
returnScore: .asciiz "\n The grade is: "
newScore: .asciiz "\n Would you like to enter a new score? \n (Y)Yes  (N)No"
newScoreSelection: .asciiz "Enter 'Y' or 'N' for your selection: "
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
	
	



exit:
	li $v0, 10
	syscall