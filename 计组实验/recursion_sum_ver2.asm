###########################################################################
#
#    #include<iostream>
#    using namespace std;
#    int sum(int n) {
#        if (n != 1) {
#            return n+sum(n-1);
#        }
#        return 1;
#    }
#
#    int main() {
#      int n = 10;
#      int result = sum(n);
#      cout << result << endl;
#      return 0;
#    }
#
###########################################################################
.text
.globl main
main:
  # Argument for termination condition is saved in $s1, it is 1.
  addi $s1,$0,1
  # Calculate the sum from 1 to 10, n = 10, it is saved in $a1.
  addi $a1,$0,10

  # jump to funcion int sum(int n)
  jal sum
  # print result
  j result

# function
sum:
  # push
  # adjust stack for 2 items (2 * 4 = 8)
  addi $sp,$sp,-8
  #save return address
  sw $ra,4($sp)
  #save argument
  sw $a1,0($sp)

  # n ！= 1, continue to push
  bne $a1,$s1,push_number_and_calculate

  # n == 1, return 1 (pop)
  addi $v0,$0,1
  addi $sp,$sp,8
  # continue to pop
  jr $ra

  # branch
  push_number_and_calculate:
    # n = n - 1
    addi $a1,$a1,-1
    # push
    jal sum

    # pop 2,3,4,...,10, and calculate n+sum(n-1)
    # load argument
    lw $a1,0($sp)
    # load return address
    lw $ra,4($sp)
    # adjust stack for 2 items (2 * 4 = 8)
    addi $sp,$sp, 8
    # n+sum(n-1)
    add $v0,$a1,$v0

    # continue to pop until return main
    jr $ra


result:
  move $a0,$v0
  li $v0, 1                                        # load appropriate system call code into register $v0
  syscall

  la $a0, change                                   # load address of string "change"
  li $v0, 4                                        # load appropriate system call code into register $v0
  syscall

  li $v0, 10                                       # exit
  syscall

.data                                              # statement of data
  change:                                          # name of string
       .asciiz "\n"                                # definition of string