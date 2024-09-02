.globl entrypoint
entrypoint:
    lddw r2, message    // Store the message pointer
    stxdw [r10-48], r2  // Assign to r10-48
    lddw r3, 20         // Store message length
    stxdw [r10-40], r3  // Assign to r10-40
    mov64 r1, r10       // Point r1 to r10
    add64 r1, -48       // Go back 48 bytes
    mov64 r3, r10       // Point r3 to r10
    add64 r3, -32       // Go back 32 bytes
    mov64 r2, 1         // Set number of hashes to 1
    call sol_sha256
    mov64 r1, r3        // Assign r3 to r1
    lddw r2, 32         // Set length to 32
    call sol_set_return_data
    exit
.extern sol_set_return_data sol_sha256
.rodata
    message: .ascii "sbpf asm is awesome!"