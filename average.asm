.data
mesg1: .asciiz "Shahd Elnassag ^_^\n"
mesg2: .asciiz "Average is: "
mesg3: .asciiz "\n"
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  #-->  static Array 1 
array2: .word 7, 2, 5, 11, 4, 6, 1, 1, 8, 3  #-->  static Array 2 
size: .float 10.0  
sum1: .word   # --> Sum of Array 1
sum2: .word   # --> Sum of Array 2
avg1: .float 0.0  # --> Average of Array 1
avg2: .float 0.0  # --> Average of Array 2

.text
globals:
main:
    # Print mesg1
    la $a0, mesg1
    li $v0, 4  
    syscall

    # Call average fun for arrays
    la $a0, array  
    la $a1, array2 
    jal calculate_average

    # Print average for Array 1
    la $a0, mesg2
    li $v0, 4  
    syscall
    l.s $f12, avg1
    # Load avg1
    li $v0, 2  
    syscall

    # Print mesg3 
    la $a0, mesg3
    li $v0, 4  
    syscall

    # Print average for Array 2
    la $a0, mesg2
    li $v0, 4  
    syscall
    # Load avg2
    l.s $f12, avg2  
    li $v0, 2  
    syscall

    # Print mesg3 
    la $a0, mesg3
    li $v0, 4  
    syscall

    # terminate program
    li $v0, 10  
    syscall

calculate_average:
    # Initialize counter and sums
    li $t0, 0       # Counter
    li $t1, 0       # --> Sum1
    li $t2, 0       # --> Sum2

loop:
    # Check if counter < 10
    li $t3, 10  
    bge $t0, $t3, compute_averages

    # Load elements from both arrays
    lw $t4, 0($a0)  # array1
    lw $t5, 0($a1)  # array2

    # Add elements its sum
    add $t1, $t1, $t4  # sum1 += array1 
    add $t2, $t2, $t5  # sum2 += array2 

    # Increment counter and array pointers
    addi $t0, $t0, 1
    addi $a0, $a0, 4  # Move to next element in array1 --> (4 because intger 4bytes)
    addi $a1, $a1, 4  # Move to next element in array2 --> (4 because intger 4bytes)
    j loop

compute_averages:
    # Convert sum1 to float
    mtc1 $t1, $f0        # Move integer sum1 to $f0
    cvt.s.w $f0, $f0     # Convert $f0 to single-precision float

    # Convert sum2 to float
    mtc1 $t2, $f1        # Move integer sum2 to $f1
    cvt.s.w $f1, $f1     # Convert $f1 to single-precision float

    # Load size
    la $t4, size         
    l.s $f2, 0($t4)      # Load 10.0 into $f2

    # Divide sum1 by 10.0 
    div.s $f3, $f0, $f2  # avg1 = sum1 / 10.0

    # Divide sum2 by 10.0
    div.s $f4, $f1, $f2  # avg2 = sum2 / 10.0

    # Store averages in their respective memory locations
    s.s $f3, avg1        # Store avg1
    s.s $f4, avg2        # Store avg2

    # Return to caller
    jr $ra
