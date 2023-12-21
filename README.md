# Go-grailbio repro

Repro repo for the error:

```
runtime: pcHeader: magic= 0xfffffff1 pad1= 0 pad2= 0 minLC= 1 ptrSize= 8 pcHeader.textStart= 0x3415c0 text= 0x561f866995c0 pluginpath= 
fatal error: invalid function symbol table
runtime: panic before malloc heap initialized

runtime stack:
runtime.throw({0x561f86421281?, 0x0?})
        GOROOT/src/runtime/panic.go:1077 +0x5c fp=0x7fff00b3e028 sp=0x7fff00b3dff8 pc=0x561f866ceb7c
runtime.moduledataverify1(0x8?)
        GOROOT/src/runtime/symtab.go:533 +0x816 fp=0x7fff00b3e148 sp=0x7fff00b3e028 pc=0x561f866ec176
runtime.moduledataverify(...)
        GOROOT/src/runtime/symtab.go:519
runtime.schedinit()
        GOROOT/src/runtime/proc.go:724 +0x34 fp=0x7fff00b3e190 sp=0x7fff00b3e148 pc=0x561f866d2694
runtime.rt0_go()
        src/runtime/asm_amd64.s:349 +0x11c fp=0x7fff00b3e198 sp=0x7fff00b3e190 pc=0x561f866fe3bc
```

The above error comes while using `llvm_toolchain_with_sysroot`. The error can be reproduced with the following command:

```
bazel run --extra_toolchains @llvm_toolchain_with_sysroot//:all //:gazelle_bin
```

However, when using a toolchain without sysroot, and ensuring `libgcc-9-dev` (in case of ubuntu) is installed in the development environment, The error does not occur:

```
bazel run --extra_toolchains @llvm_toolchain_without_sysroot//:all //:gazelle_bin
```
