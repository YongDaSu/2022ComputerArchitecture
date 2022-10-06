.data
str1:    .string "Hello World"
str2:    .string "length of last word is "
str3:    .string "I  am   a student   "
a:       .string "a"
space:   .string " "


.text
# s1 = str1 address
# s2 = space
# s3 = length
# t1 = str1[i]

main:
        #function:lengthOfLastWord(char * s)
        la          s1, str3
        lb          s2, space
        add         s3, x0, x0        #initialize length
        jal         ra, strlen        #strlen()
        #if the last letter is space, find the position of the last letter is not space
        #print result
        la          a0, str3
        addi        a7, x0, 4
        ecall
        li          a0, 13            #CR
        li          a7, 11
        ecall
        la          a0, str2          #length of last word is
        addi        a7, x0, 4
        ecall
        add         a0, s3, x0        #length
        li          a7, 1
        ecall
        li          a7, 10            #end
        ecall 
        
strlen:
        addi        s1, s1, 1         #find the last position of the string
        lb          t0, 0(s1)
        bne         t0, x0, strlen
        addi        s1, s1, -1
        lb          t0, 0(s1)
        bne         t0, s2, loop2
loop1:                                #my first while
        addi        s1, s1, -1        #s--
        lb          t0, 0(s1)         #t0=s[i], i=length(s)-1
        beq         t0, s2, loop1     #while(char[i]==" ")
loop2:                                #my second while
        addi        s1, s1, -1        #s--
        lb          t0, 0(s1)         #t0=s[i], i=last word
        addi        s3, s3, 1         #length++
        blt         s1, x0, skip
        bne         t0, s2, loop2     #while(char[i]!=" ")
skip:        
        ret