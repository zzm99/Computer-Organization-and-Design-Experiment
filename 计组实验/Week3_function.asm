###########################################################################
#
#    #include<iostream>
#    using namespace std;
#    int add(int a, int b) {
#        int sum;
#        sum = a + b;
#        return sum;
#    }
#
#    int main() {
#      int a = 2;
#      int b = 3;
#      int sum = add(a,b)
#      cout << sum << endl;
#      return 0;
#    }
#
###########################################################################
.text
.globl main
main:
  addi $a1,$0,2                             # $a1: the register to save 2, parameters are stored in registers $a0 - $a3
  addi $a2,$0,3                             # $a2: the register to save 3

  jal print_two_number                      # print two immediates
  jal addfunction                           # jump to a function addfunction
  j result                                  # print result

addfunction:                                # add function
  add $v1,$a1,$a2                           # Calculate the sum and save it into $v1, the registers $v0 and $v1 save the return value
  jr $ra                                    # The return address is saved in $ra

print_two_number:
  move $a0,$a1                                     # move the value into $a0
  li $v0, 1                                        # load appropriate system call code into register $v0
  syscall
  la $a0, change                                   # load address of string "change"
  li $v0, 4                                        # load appropriate system call code into register $v0
  syscall

  move $a0,$a2
  li $v0, 1                                        # load appropriate system call code into register $v0
  syscall
  la $a0, change                                   # load address of string "change"
  li $v0, 4                                        # load appropriate system call code into register $v0
  syscall

  jr $ra

result:
  move $a0,$v1
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