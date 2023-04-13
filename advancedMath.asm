#Names: Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Date: 04/16/23
#Objectives: takes two int from user that outputs the one of ints to the power of the other
# - One int will be 'x', the other 'y'. The user must know which is which 
# - Result = x^y and return to user
# - Includes a main label, a looping label, exit label and loop counter

#macro defString
.macro defString(%str)
li $v0, 4
la $a0, %str
syscall
.end_macro

.data
explanation1: .asciiz "This program asks the user to input a value for 'x' and 'y'."
explanation2: .asciiz "\nThen, it finds the value of x to the power of y. "
explanation3: .asciiz "\nFor example, 2 to the power of 3 is 8.\n"
xPrompt: .asciiz "\nEnter a number for 'x': "
yPrompt: .asciiz "\nEnter a number for 'y': "
resultPrompt: .asciiz "\n'x' to the power of 'y' is: "

.text
main:
	#print out explanation of program
	defString(explanation1)
	defString(explanation2)
	defString(explanation3)
	
	#initialize loop counter into $t7
	move $t7 $zero
	#setup starting number for loop
	li $t2, 1
	
	defString(xPrompt)
	#get user 'x'
	li $v0, 5
	syscall
	move $t0, $v0 #users 'x' stored in $t0

	defString(yPrompt)
	#get user 'y'
	li $v0, 5
	syscall
	move $t1, $v0 #users 'y' stored in $t1
	beqz $t1, result #checks if exponent is 0
	bltz $t1, negloop
	
	j loop
	
loop: 
	mult $t2, $t0
	
	mflo $t2
	
	#increment loop counter
	addi $t7, $t7, 1
	#break out of the loop when counter matches the number of elements
	beq $t7, $t1, result
	
	j loop

negloop:
	div $t2, $t0
	
	#increment loop counter
	subi $t7, $t7, 1
	#break out of the loop when counter matches the number of elements
	beq $t7, $t1, result
	
	j negloop

result: 
	#print out result
	defString(resultPrompt)
	li $v0, 1
	move $a0, $t2
	syscall
	
	j exit

exit:
	li $v0, 10
	syscall
