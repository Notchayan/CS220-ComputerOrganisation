.data   
prompt_length:  .asciiz "Enter length of the array: "
prompt_number:  .asciiz "Input float number: "
prompt_answer:  .asciiz "\nAnswer: "
.text   
                .globl  main
main:           
    # Get Length of Array
    li      $v0,    4
    la      $a0,    prompt_length
    syscall 
    li      $v0,    5
    syscall 

    # $s0 <- n
    add     $s0,    $v0,            $0
    # $t0 <- n
    add     $t0,    $s0,            $0
    # $f1 <- 0
    # sum = $f1
    sub.s   $f1,    $f1,            $f1

    add     $t0,    $0,             $0
    add     $t1,    $0,             $0
    # Get Elements of array
loop1:          
    li      $v0,    4
    # Get Each Element
    la      $a0,    prompt_number
    syscall 
    li      $v0,    6
    syscall 
    andi    $t2,    $t1,            1
    beq     $t2,    $0,             add_it
    sub.s   $f1,    $f1,            $f0
    j       loop2
loop2:          
    addi    $t1,    $t1,            1
    bne     $t0,    $t1,            loop1
    li      $v0,    4
    la      $a0,    prompt_answer
    syscall 
    li      $v0,    2
    mov.s   $f12,   $f1
    syscall 
    jr      $ra
add_it:         
    add.s   $f1,    $f1,            $f0
