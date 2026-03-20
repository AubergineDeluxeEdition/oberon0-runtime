;; SPDX-FileCopyrightText: 2025 Jacques Supcik <jacques.supcik@hefr.ch>
;;
;; SPDX-License-Identifier: Apache-2.0 OR MIT

(module
  (func $add (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add
  )
  (export "add" (func $add))
)
