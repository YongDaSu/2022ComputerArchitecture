#
# If the last position has space, I recognized the last position which is not space.
# Then I start to count the length, if I encounter a space, I zero the length.
# When I reach the last position which is not space, I return the length.
#
.data
str1:    .string "Hello World"
str2:    .string "i am a student  "
str3:    .string "a"
str:     .string "length of last word is "  
space:   .string " "


.text
# s1 = str1 address
# s2 = space
# s3 = length
# s4 = filter

main:
        #function:lengthOfLastWord(char * s)
        la          s1, str1
        lb          s2, space
        addi         s3, x0, 1        #initialize length = 1
        #find the position of the last letter is not space
        jal         ra, strlen        #strlen()
        
        #print result
        la          a0, str1
        addi        a7, x0, 4
        ecall
        li          a0, 13            #CR
        li          a7, 11
        ecall
        la          a0, str           #length of last word is
        addi        a7, x0, 4
        ecall
        add         a0, s3, x0        #length
        li          a7, 1
        ecall
        li          a7, 10            #end
        ecall 
        
strlen:
        addi        s1, s1, 1         #find the last position of the string
        addi        s4, s4, 1
        lb          t0, 0(s1)
        bne         t0, x0, strlen
loop1:                             
        addi        s1, s1, -1        #s--
        addi        s4, s4, -1        #the last position is not space
        lb          t0, 0(s1)         #t0=s[i]
        lb          t1, 0(s1)
        beq         t0, s2, loop1     #while(char[i]==" ")
        la          s1, str1
loop2:  
        beq         s4, x0, return    #if encounter the last position, return
        addi        s4, s4, -1        
        addi        s1, s1, 1         #s++
        lb          t0, 0(s1)         #t0=s[i]
        addi        s3, s3, 1         #length++
        beq         t0, s2, zero
        j           loop2
zero:                                 #if encounter a space, length = 0
        addi        s3, x0, 0
        j           loop2
return:    
        ret
