.data
array01: .word 15, 8, 23, 4, 16, 42, 7, 5, 3, 9 
array02: .word 25, 18, 2, 34, 6, 2, 1, 5, 31, 90  
space: .asciiz "\n"
min_message01: .asciiz "The minimum value in first array is: "
min_message02: .asciiz "The minimum value in second array is: "

.text
main:
    # Process first array (array01)
    la $t0, array01        
    lw $t1, 0($t0)         
    addi $t2, $zero, 1     

while01:
    beq $t2, 10, print_min01  

    # Get the next element
    sll $t3, $t2, 2        
    add $t4, $t0, $t3      
    lw $t5, 0($t4)        

    # Check if the current element is less than min
    blt $t5, $t1, update_min01
    j next_iteration01

update_min01:
    move $t1, $t5          

next_iteration01:
    addi $t2, $t2, 1      
    j while01             

print_min01:
    # Print the minimum value of array01
    li $v0, 4              
    la $a0, min_message01  
    syscall

    li $v0, 1             
    move $a0, $t1          
    syscall

    li $v0, 4             
    la $a0, space         
    syscall

    # Process second array (array02)
    la $t0, array02        
    lw $t1, 0($t0)        
    addi $t2, $zero, 1     

while02:
    beq $t2, 10, print_min02  

    # Get the next element
    sll $t3, $t2, 2        
    add $t4, $t0, $t3      
    lw $t5, 0($t4)         

    # Check if the current element is less than min
    blt $t5, $t1, update_min02
    j next_iteration02

update_min02:
    move $t1, $t5          

next_iteration02:
    addi $t2, $t2, 1      
    j while02              

print_min02:
    # Print the minimum value of array02
    li $v0, 4             
    la $a0, min_message02  
    syscall

    li $v0, 1              
    move $a0, $t1          
    syscall

    li $v0, 4             
    la $a0, space         
    syscall

    li $v0, 10           
    syscall
