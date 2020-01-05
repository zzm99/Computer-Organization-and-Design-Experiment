.data
	Array: .word 21,4,12,6,89,17,33,10,9,51

.text
main:
	la $t0, Array
	li $s0,0
	li $s1,0

loop:
	lw $s3,0($t0)
	addu $t0, 4
	addu $s0, $s0, 1
	addu $s1, $s1, $s3
	blt $s0, 10, loop

done:
	move $a0, $s1
	li $v0, 1
	syscall