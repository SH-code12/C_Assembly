.data
mesg1: .asciiz "Asmaa Atef ^_^\n"
mesg2: .asciiz "Count of even numbers is: "
mesg3: .asciiz "\n"
array: .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4  # --> static Array 1
array2: .word 19, 2, 3, 7, 5, 10, 9, 0, 6, 1   # --> static Array 1
size: .word 10
count1: .word 0  # -->  Count1
count2: .word 0  # --> Count2

.text
globals:
main:
    # Print mesg1
    la $a0, mesg1
    li $v0, 4 
    syscall

    # Call calculate_countfun for the arrays
    la $a0, array  
    la $a1, array2 
    jal calculate_count

    # Print count1 
    la $a0, mesg2
    li $v0, 4  
    syscall

    # Load count1 
    lw $a0, count1  
    li $v0, 1       
    syscall

    # Print mesg3
    la $a0, mesg3
    li $v0, 4  
    syscall

    # Print count2 
    la $a0, mesg2
    li $v0, 4  
    syscall
    
    # Load count2 
    lw $a0, count2  
    li $v0, 1       
    syscall

    # Print mesg3
    la $a0, mesg3
    li $v0, 4  
    syscall

    # Terminate program
    li $v0, 10  
    syscall

calculate_count:
    # Initialize counters
    li $t0, 0       # --> counter
    li $t1, 0       # --> Count1 
    li $t2, 0       # --> Count2

loop:
    # Check if counter < size
    li $t3, 10      # Size of the arrays
    bge $t0, $t3, counts

    # Load elements from both arrays
    lw $t4, 0($a0)  # --> Array 1
    lw $t5, 0($a1)  # --> Array 2

    # Check if Array 1 element is even
    andi $t6, $t4, 1  # --> t6 = t4(a1) % 2
    beq $t6, $zero, increment_count1

check_a2:
    # Check if Array 2 element is even
    andi $t7, $t5, 1  # --> t7 = t5(a2) % 2
    beq $t7, $zero, increment_count2

increment_counter:
    # Increment counter
    addi $t0, $t0, 1  # --> t0 = t0 + 1
    addi $a0, $a0, 4  # Move to next index in a1 --> (4 because intger 4bytes)
    addi $a1, $a1, 4  # Move to next index in a2 --> (4 because intger 4bytes)
    j loop

increment_count1:
    addi $t1, $t1, 1  
    j check_a2  # go to check_a2 

increment_count2:
    addi $t2, $t2, 1  
    j increment_counter   # go to increment_counter

counts:
    # Store counts 
    sw $t1, count1  
    sw $t2, count2 

    # Return 
    jr $ra
