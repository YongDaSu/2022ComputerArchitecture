.data
arr1: .word 2, 6 
arr2: .word 1, 2, 34, 3, 4, 5, 7, 23, 25
arr3: .word 1, 3, 4, 7, 9, 12
str0:  .string "\nThe answer is false\n"
str1:  .string "\nThe answer is true\n"
str2:  .string " "
#the size of array is known in advanced.
arr1_size:    .word 2
arr2_size:    .word 9
arr3_size:    .word 6

.text
# a0 : save the return value
# a1 : the base address of arr
# a2 : the size of arr
# t1 : count
# t2 : 3
# s0 : arr[i]
# s1 : the value of (*(arr + 1) & 1)

initialize:
        la    a1,    arr1
        lw    a2,    arr1_size
        addi  t1, x0, 0
        addi  t2, x0, 3
        jal   ra, print_array
        la    a1,    arr1          #recover the addr of array1
        lw    a2,    arr1_size     #recover the array size of array1
        jal   ra, main             #strat main program
        la    a1,    arr2
        lw    a2,    arr2_size
        addi  t1, x0, 0
        addi  t2, x0, 3
        jal   ra, print_array
        la    a1,    arr2          #recover the addr of array1
        lw    a2,    arr2_size     #recover the array size of array1
        jal   ra, main             #strat main program
        la    a1,    arr3
        lw    a2,    arr3_size
        addi  t1, x0, 0
        addi  t2, x0, 3
        jal   ra, print_array
        la    a1,    arr3          #recover the addr of array1
        lw    a2,    arr3_size     #recover the array size of array1
        jal   ra, main             #strat main program
        j     Exit
print_array:                       #print all array element
        lw    s0, 0(a1)            #load element
        addi  a0, s0, 0            #a0 = s0        
        li    a7, 1                #print string
        ecall
        la    a0, str2             #print space
        li    a7, 4
        ecall
        addi  a1, a1, 4            #next element
        addi  a2, a2, -1           #array size -1
        bne   a2, x0, print_array  #if still have element, go print    
        ret
main:
        blt   a2, t2, False        #if array size <3, go to False directly
for_loop:
        addi  a2, a2, -1           #array size -1
        lw    s0, 0(a1)            #load element
        addi  a1, a1, 4            #next  element
        andi  s1, s0, 1            #bitwise and 1, if an odd, s1 = 1
        bne   s1, x0, ADD_1        #branch to ADD1 if an odd
        addi  t1, x0, 0            #count = 0 if even
        bne   a2, x0, for_loop     #if still have element, go to for_loop 
        j     False                #if no consecutive odds, j False
ADD_1:
        addi  t1, t1, 1            #count = count + 1
        beq   t1, t2, True         #if count = 3, True 
        bne   a2, x0, for_loop     #if count != 3 but still have other elements in the array       
        j     False
True:
        la    a0, str1
        li    a7, 4
        ecall
        ret
False:
        la    a0, str0
        li    a7, 4
        ecall    
        ret
Exit:
        li   a7, 10
        ecall
                
