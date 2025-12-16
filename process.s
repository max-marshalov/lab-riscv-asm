.global process

process:
    addi sp, sp, -32
    sw ra, 28(sp)
    sw s0, 24(sp)
    sw s1, 20(sp)
    sw s2, 16(sp)
    sw s3, 12(sp)
    sw s4, 8(sp)
    
    mv s0, a0        
    mv s1, a1        
    mv s2, a2        
    mv s3, a3        
    
    li t0, 0       
    li t1, 0         
    
    mv t2, s0
    blt s0, s1, set_min
    mv t2, s1

set_min:
    mv s4, t2        
    beqz s4, error   
    
loop:
    bge t1, s4, end_loop
    li t3, 20
    mul t4, t1, t3     
    add t4, s2, t4     
    lw t5, 0(t4)       
    add t0, t0, t5     
    addi t1, t1, 1
    j loop

end_loop:
    div t0, t0, s4     
    sw t0, 0(s3)
    j done

error:
   
    li t0, 0
    sw t0, 0(s3)

done:
    
    lw ra, 28(sp)
    lw s0, 24(sp)
    lw s1, 20(sp)
    lw s2, 16(sp)
    lw s3, 12(sp)
    lw s4, 8(sp)
    addi sp, sp, 32
    
    ret