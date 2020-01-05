.data
	Array: 
		.word 21,4,12,6,89,17,33,10,9,51
	seperate:
		.asciiz " "

# for i(0~n-1)
# 	for j(0~n-i)

.text
main:
	la $t6,Array     # t6 = a[0]
    move $t7,$zero   # t7 = 0
    li $t8,10        # t8 = 10 (size)
    move $t9,$zero   # t9 = 0

loop1:
    move $t9,$zero   # t9 = 0

loop2:
	move $t0,$t9     # t0 = t9
    mul $t0,$t0,4	 # t0 = 4*t9
    addu $t1,$t0,$t6   
    lw $t2,0($t1)   # t2 = a[t9]

	addi $t0,$t9,1   # t0 = t9 + 1
    mul $t0,$t0,4
    addu $t4,$t0,$t6
    lw $t3,0($t4)	# t3 = a[t9+1]

    bge $t2,$t3,skip # if(t2 >= t3) goto skip
    sw $t3,0($t1)  # if(t2 < t3) swap
    sw $t2,0($t4)

skip:
   addi $t9,$t9,1   # t9++
   addi $t0,$t9,1   # t0 = t9 + 1
   sub $t1,$t8,$t7    # t1 = t8 - t7
   blt $t0,$t1,loop2  
   addi $t7,$t7,1     
   sub $t2,$t8,1
   blt $t7,$t2,loop1

set:
	move $t7,$zero
	
done:
	move $t0,$t7
   	mul $t0,$t0,4
   	addu $t1,$t0,$t6
   	lw $a0,0($t1)
  	li $v0,1
   	syscall

   	la $a0,seperate  
   	li $v0,4
   	syscall

   	addi $t7,$t7,1
   	blt $t7,10,done