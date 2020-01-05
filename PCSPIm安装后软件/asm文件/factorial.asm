.data
    prompt1: .asciiz "Enter the number\n"
    prompt2: .asciiz "The factorial of n is:\n"

.text
main:
    # Print prompt1
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read integer
    li $v0, 5
    syscall

    # Call factorial
    move $a0, $v0
    jal factorial
    move $a1, $v0 # save return value to a1

    # Print prompt2
    li $v0, 4
    la $a0, prompt2
    syscall

    # Print result
    li $v0, 1
    move $a0, $a1
    syscall

    # Exit
    li $v0, 10
    syscall

    ## Function int factorial(int n)
    factorial:
        ## YOUR CODE HERE
        addi $sp,$sp,-8            #adjust stack for 2 items
        sw   $ra,4($sp)            #save return address
        sw   $a0,0($sp)            #save the argument n
    
        slti $t0,$a0,1             #if n < 1,then set $t0 as 1
        beq  $t0,$zero,L1          #if equal,then jump L1
                                   #above all,if n >= 1,then jump L1
        #if(n < 1)
        addi $v0,$zero,1            #return 1
        addi $sp,$sp,8              #pop 2 items off stack
        jr   $ra                    #return to caller
        #else
        L1:
            add $a0,$a0,-1          #argument :n - 1
            jal factorial           #call factorial with (n-1)
        
           lw   $a0,0($sp)          #restore argument n
           lw   $ra,4($sp)          #restore address
           addi $sp,$sp,8           #adjust stack pionter
           mul  $v0,$a0,$v0         #return n * factorial(n-1)
           jr   $ra                 #return to caller
    ## END OF YOUR CODE
  #jr $ra