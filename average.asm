.data
mesg1: .asciiz "Shahd Elnassag^_^\n"
mesg2: .asciiz "Enter number "
mesg3: .asciiz " of array: "
mesg4: .asciiz "Average is: "
mesg5: .asciiz "\n"
array: .space 40           
size: .float 10.0         

.text
globals:
main:
    # Call average function
    jal avarage

    # Exit program
    li $v0, 10  
    syscall

avarage:
    # Print mesg1
    la $a0, mesg1
    li $v0, 4  
    syscall

    # Initialize sum to 0 and counter to 0
    li $t0, 0   # counter = 0
    li $t1, 0   # sum = 0

loop:
    # Check if counter < 10
    li $t2, 10  
    bge $t0, $t2, calculate_average

    # Print mesg2
    la $a0, mesg2
    li $v0, 4
    syscall

    # Print counter + 1
    addi $t3, $t0, 1  # t3 = t0 + 1
    move $a0, $t3
    li $v0, 1         
    syscall

    # Print mesg3
    la $a0, mesg3
    li $v0, 4
    syscall

    # Read integer input
    li $v0, 5  # Read integer syscall
    syscall
    move $t4, $v0  # Store input in t4

    # Store input in array
    la $t5, array
    mul $t6, $t0, 4  # t6 = n * 4 (byte offset)
    add $t5, $t5, $t6
    sw $t4, 0($t5)

    # Add input to sum
    add $t1, $t1, $t4

    # Increment n
    addi $t0, $t0, 1
    j loop

calculate_average:
    # Convert sum to float
    mtc1 $t1, $f0        # Move integer sum to floating-point register $f0
    cvt.s.w $f0, $f0     # Convert integer in $f0 to single-precision float

    # Divide by 10.0 (as a float)
    la $a0, size          # Load size address
    l.s $f1, 0($a0)      # Load 10.0 into $f1
    div.s $f2, $f0, $f1  # Perform float division: $f2 = $f0 / $f1

    # Print mesg
    la $a0, mesg4
    li $v0, 4            # Print string syscall
    syscall

    # Print the float average
    mov.s $f12, $f2      # Move result to 
    li $v0, 2            
    syscall

    # Print mesg5
    la $a0, mesg5
    li $v0, 4           
    syscall

    # Return to caller
    jr $ra
