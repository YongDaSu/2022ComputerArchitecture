<contributed by WangHanChi>
/***
In this virsion of the program, I found some memory segmentation fault.
So I fix the program, where is in https://github.com/YongDaSu/2022ComputerArchitecture/blob/main/Lab02/Three%20Consecutive%20Odds.s
***/


.data
test0: .word 2, 6, 4, 1
test1: .word 1, 2, 34, 3, 4, 5, 8, 23, 12
test2: .word 1, 2, 5, 7, 8, 10, 13, 14, 17
str0:  .string "\nThe answer is false\n"
str1:  .string "\nThe answer is true\n"
str2:  .string " "
.text
# a0 : save the return value
# a1 : the base address of arr
# a2 : the size of arr
# t0 : i
# t1 : count
# s0 : arr[i]
# s1 : the value of (*(arr + 1) & 1)

main:
    addi s2, x0, 3		# Set s2 = 3
    addi t3, x0, 1          	# set t3 = 1       
    la a1, test0        	# Load the address to a1
    addi a2, x0, 4          	# Load the array size to a2
    jal ra, print_number	# go to print_number
    la a1, test1              	# Load the address to a1
    addi a2, x0, 9            	# Load the array size to a2
    jal ra, print_number 	# go to print_number
    la a1, test2        	# Load the address to a1
    addi a2, x0, 9           	# Load the array size to a2
    jal ra, print_number	# go to print_number
    j Exit			# exit the program
print_number:
    mv t2, a2			# copy the data form a2 to t2
    lw s0, 0(a1)		# load the data form a1 to s0
    addi a1, a1, 4		# go to the next data 
    addi a0, s0, 0		# store the data from s0 to a0
    li, a7, 1			# call system call (printInt) 
    ecall
    la a0, str2    		# load string form str2 to a0
    li a7, 4    		# Call system call (printString)
    ecall    
    addi a2, a2, -1		# arrSize -= 1 
    bge a2, t3, print_number  	# if (a2 > t3) go to print_number
threeConsecutiveOdds: 
	add t0, x0, x0         # int i = 0;
    blt s2, s3, false      	# if(arrSize < 3) return false
forloop: 
    lw s0, 0(a1)              	# Load the value form a1 to s0
    addi a1, a1, 4            	# go to the next data  
    andi s1, s0, 1            	# (*(arr + i) & 1) and s1 will store it
    beq t3, s1, isEqual       	# (*(arr + i) & 1) equal 1 or not
    addi t1, x0, 0            	# count = 0
    addi t0, t0, 1            	# i = i + 1
    blt t0, s2, forloop       	# if i < arrSize
    j false
isEqual:
    addi t1, t1, 1        	# ++count
    beq s2, t1, true      	# if(++count == 3)
    j forloop             	# return to the forloop 
true: 
    la a0, str1    		# load string
    li a7, 4    		# Call system call (printString)
    ecall
    ret
false: 
    la a0, str0    		# load string
    li a7, 4    		# Call system call (printString)
    ecall
    ret
Exit:
    li a7, 10           	# Exit the program
    ecall
