.text
.globl main
main:
	lui $t1, 8193
	ori $t1, $t1, 18724
	
	move $a0, $t1
	li $v0,0
	syscall

	li $v0,10
	syscall

.data
	str:
		.asciiz "hello world\n"
	