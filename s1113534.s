# 1113534 GUERRIER Hantz Brunet

.globl __start

.rodata
.data
# open flags
O_RDWR:    .word 0b0000100


# File and buffer
filename:  .asciiz "file.txt"
buffer:    .zero 1024

# Messages
descriptor_num:  .asciiz "** The file descriptor number: "
termination: .asciiz "** Program is terminated normally.\n"
Space: .asciiz "\n"

.text
__start:

#print the beginning massage
  li a0, 4
  la a1, descriptor_num
  ecall
  
    # Open the file
    li a0, 13     # ecall code for openat
    la a1, filename # Load address of filename
    lw a2,  O_RDWR # Load read and write flag
    ecall
    mv t1, a0       # Store file descriptor
    
    li a0, 1
    mv a1, t1
    ecall
    
    li a0, 4
   la a1, Space
   ecall

    
   #read the file
   li a0, 14
   mv a1, t1
   la a2, buffer
   li a3, 1024
   ecall
   
   

    # Print the file content
    li a0, 4  
    mv a1, a2
    ecall

   #close the file
    li a0, 16
    mv a1, t1
    ecall 
   
   #Adding space 
    li a0, 4
    la a1, Space
    ecall
   
   #print the termination massage 
    li a0, 4
    la a1, termination
    ecall
   
   #close everything  
    li a0, 10
    ecall