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

    (func (export "add")
        ;; Réserve 12 octets pour les 3 entiers
        global.get $sp ;; On prend la position actuelle (ex: 65536)
        i32.const 12
        i32.sub ;; On recule de 12 octets (4 octets par entier)
        global.set $sp ;; On met à jour le pointeur

        ;; On ouvre le flux avant de faire le premier ReadInt
        call $open_input

        ;; Lire X
        global.get $sp ;; On donne l'adresse 65524 (le début de notre zone)
        call $read_int ;; L'utilisateur tape "10" -> le nombre 10 est écrit à l'adresse 65524

        ;; Lire Y
        global.get $sp
        i32.const 4 ;; On avance de 4 octets (pour arriver sur y, après x)
        i32.add ;; On calcule l'adresse 65528 (65524 + 4)
        call $read_int ;; L'utilisateur tape "20" -> le nombre 20 est écrit à l'adresse 65528

        ;; Calcule X + Y

        ;; Préparer le résultat (Z)
        global.get $sp
        i32.const 8
        i32.add

        ;; On va chercher les valeurs de X et Y dans la mémoire
        global.get $sp
        i32.load

        global.get $sp
        i32.const 4
        i32.add
        i32.load

        ;; On additionne les deux valeurs
        i32.add

        ;; On stocke le résultat dans la mémoire
        i32.store

        ;; Affichage
        global.get $sp
        i32.const 8
        i32.add
        i32.load
        i32.const 0 ;; Length 0, second param de WriteInt
        call $write_int

        ;; Libère la mémoire
        global.get $sp
        i32.const 12
        i32.add
        global.set $sp ;; Remonte le pointeur au point de départ

    )
)
