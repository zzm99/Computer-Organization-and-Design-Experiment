.data     
    msg: .asciiz"Enter a Number "
    msg1: .asciiz"The result is: "

.text                   
main:                    
    li $v0,4             
    la $a0,msg           
    syscall  

    li $v0,5              
    syscall  

    move $s0,$v0          
    li $s7, 1      

factorial:              
    mult $s0,$s7        
    mflo $s7     
    sub $s0,$s0,1         
    bgt $s0,1,factorial   

done:
    li $v0,4
    la $a0,msg1
    syscall

    move $a0,$s7         
    li $v0,1              
    syscall          

    li     $v0, 10           
    syscall         