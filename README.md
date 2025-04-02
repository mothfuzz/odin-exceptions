# odin-exceptions
Exception Handling, now for Odin!!

Proven by countless successful codebases withstanding the test of time, an exception mechanism is truly the best error handling system we have today.
But some few ideologues in this day and age continue to spread the rumour that mere value errors can capture the ergonomics and safety of a proper exception handler - see Go, Rust, Zig, and yes, our beloved Odin.

But worry no more! Using this simple 32-lines-with-whitespace library, now you can experience the hassle-free paradigm of proper exceptions right in Odin, [despite what Bill says](https://www.gingerbill.org/article/2018/09/05/exceptions---and-why-odin-will-never-have-them/).

Usage of the library is simple, see the exceptions_example.odin:
```odin
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
```

This library supports trying throwing and catching at both the procedure level and at the top level, and even supports printing the line in the source code where the error was thrown. Wow!

Note that it doesn't support call stack unwinding, but such a thing is trivial to implement in user space anyway!
