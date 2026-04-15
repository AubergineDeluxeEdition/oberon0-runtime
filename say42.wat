(module
    ;; BLOC D'IMPORTS COMPLET (Ordre imposé par le runtime)
    (import "sys" "OpenInput" (func $open_input))
    (import "sys" "ReadInt" (func $read_int (param i32)))
    (import "sys" "eot" (func $eot (result i32)))
    (import "sys" "WriteChar" (func $write_char (param i32)))
    (import "sys" "WriteInt" (func $write_int (param i32 i32)))
    (import "sys" "WriteLn" (func $write_ln))
    (import "env" "memory" (memory 1))
    (import "env" "__stack_pointer" (global $sp (mut i32)))

    (func (export "say42")
        i32.const 42
        i32.const 0
        call $write_int
        call $write_ln
    )
)
