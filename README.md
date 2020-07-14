# cuda-linking-experiment

This is a repo for debugging the following issue with CUDA linking

```
(.init+0xb): relocation truncated to fit: R_X86_64_REX_GOTPCRELX against undefined symbol `__gmon_start__'
/usr/bin/ld: failed to convert GOTPCREL relocation; relink with --no-relax
```

Template metaprogramming is used to create 1000 kernels. These kernels will be linked to `liblarge.so`.

Maybe related: https://eli.thegreenplace.net/2012/01/03/understanding-the-x64-code-models
