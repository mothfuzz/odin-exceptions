package exceptions

import "core:fmt"
import "core:c/libc"

buf: libc.jmp_buf = {}

throw :: proc(err: i32) {
    libc.longjmp(&buf, err)
}

@(init)
init :: proc() {
    reset()
}

reset :: proc(loc := #caller_location) {
    err := libc.setjmp(&buf)
    if err != 0 {
        panic(fmt.tprintf("%d", err), loc)
    }
}

try :: proc(try: proc(), catch: proc(e: i32), loc := #caller_location) {
    err := libc.setjmp(&buf)
    if err == 0 {
        try()
    } else if catch != nil {
        catch(err)
    }
    reset(loc)
}