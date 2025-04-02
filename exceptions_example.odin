package main

import "core:fmt"
import eh "./exceptions"

panicking_proc :: proc() {
    eh.throw(123)
}

main :: proc() {
    eh.try(panicking_proc, catch=proc(err: i32) {
        fmt.println("phew!! caught an error:", err)
    })

    fmt.println("code is safe from errors!")
}