(module
    (import "sys" "OpenInput" (func $open_input))
    (import "sys" "ReadInt" (func $read_int (param i32)))
    (import "sys" "eot" (func $eot (result i32)))
    (import "sys" "WriteChar" (func $write_char (param i32)))
    (import "sys" "WriteInt" (func $write_int (param i32 i32)))
    (import "sys" "WriteLn" (func $write_ln))
    (import "env" "memory" (memory 1))
    (import "env" "__stack_pointer" (global $sp (mut i32)))

    (func (export "print_odd_numbers")
        (local $limit i32)   ;; La valeur N lue au clavier
        (local $val i32) ;; Notre compteur qui va monter (1, 3, 5...)

        ;; 1. Réserver 4 octets sur la pile pour ReadInt
        global.get $sp
        i32.const 4
        i32.sub
        global.set $sp

        ;; 2. Lire la limite N
        call $open_input
        global.get $sp        ;; On donne l'adresse du SP à ReadInt
        call $read_int

        global.get $sp
        i32.load              ;; On récupère ce que ReadInt a écrit
        local.set $limit      ;; On le stocke dans $limit

        ;; 3. Initialiser le compteur à 1 (le premier impair)
        i32.const 1
        local.set $val

        ;; 4. La Boucle
        block $exit_block
            loop $loop_top
                ;; CONDITION DE SORTIE : Si current >= limit, on se casse
                local.get $val
                local.get $limit
                i32.ge_s              ;; Est-ce que current >= limit ?
                br_if $exit_block     ;; Si OUI (1), saute à la fin du block

                ;; AFFICHAGE
                local.get $val
                i32.const 0
                call $write_int
                call $write_ln

                ;; INCREMENTATION : current = current + 2
                local.get $val
                i32.const 2
                i32.add
                local.set $val    ;; On met à jour le compteur

                ;; RECOMMENCER
                br $loop_top          ;; Saute au début de la loop
            end
        end

        ;; 5. Nettoyer la pile (Remonter le SP)
        global.get $sp
        i32.const 4
        i32.add
        global.set $sp
    )
)
