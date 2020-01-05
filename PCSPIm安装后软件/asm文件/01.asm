#############################################################
#		#include <iostream>
#		using namespace std;
#
#		int main()
#		{
#			int num[10];
#			for(int i=0; i<10; i++)
#				cin >> num[i];
#			for(int i=0; i<9; i++)
#			{
#				for(int j=0; j<9-i; j++)
#				{
#					if(num[j] < num[j+1])
#					{
#						int temp = num[j];
#						num[j] = num[j+1];
#						num[j+1] = temp;
#					}
#				}
#			}
#			for(int i=0; i<10; i++)
#			{
#				cout << num[i] << " ";
#			}
#			return 0;
#		}
#
#############################################################


.data
	Array:
		.space  40
	Seperate:
		.asciiz " "
	ccin:
		.asciiz "Input ten unsigned integers:\n"
	ccout:
		.asciiz "Output:\n"

.text
.globl main
main:
	la $t0, Array		# load address of Array in $t0
	li $v0, 4			# cout a string
	la $a0, ccin
	syscall


	add $s0, $0, $0		# $s0 = 0 

input:
	li	$v0, 5			# cin
	syscall
	sll $t1, $s0, 2		# $t1 = $s0 * 4
	add $t1, $t1, $t0	
	sw	$v0, 0($t1)
	addi $s0, $s0, 1
	slti $t3, $s0, 10	# t3 = s0 < 10 ? 1 : 0
	bnez $t3, input		# if t3 != 0, goto input


	move $s0, $0		# $s0 = 0 => int i=0; 

loop1:
	move $s1, $0		# $s1 = 0 => int j=0;

loop2:
	add $t1, $s1, $0	# t1 = j
	sll $t1, $t1, 2		
	add $t1, $t1, $t0	
	lw $s3, 0($t1) 		# get s3 = Array[j]

	addi $t2, $s1, 1	# t2 = j + 1
	sll $t2, $t2, 2		
	add $t2, $t2, $t0	
	lw $s4, 0($t2) 		# get s4 = Array[j+1]
	
	slt $t3, $s3, $s4	# t3 = Array[j] < Array[j+1] ? 1 : 0
	
	# if(t3 == 0) goto skip without swap
	beqz $t3, skip		

	# else : swap s3, s4 
	sw $s3, 0($t2)
	sw $s4, 0($t1)

skip:
	addi $s1, $s1, 1	# j++;
	addi $t4, $0, 9
	sub $t5, $t4, $s0	# t5 = 9 - i
	slt $t6, $s1, $t5	# t6 = s1 < t5 ? 1 : 0
	bnez $t6, loop2 	# if t6 == 1 continue to loop2

	# else
	addi $s0, $s0, 1	# i++
	slti $t6, $s0, 9	# t6 = s0 < 9 ? 1 : 0  (i < 9 ?)
	bnez $t6, loop1		# if t6 == 1 continue to loop1	(set j = 0)


	# else
	la $a0, ccout
	li $v0, 4
	syscall


	move $s0, $0	#  i = 0

cout_loop:
	sll $s1, $s0, 2
	add $s1, $s1, $t0
	lw $a0, 0($s1)
	li $v0, 1
	syscall

	la $a0, Seperate
	li $v0, 4
	syscall

	addi $s0, $s0, 1
	slti $t3, $s0, 10
	bnez $t3, cout_loop


	li $v0, 10
	syscall

