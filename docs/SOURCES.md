# Sources

References used to build and verify ZORKERB r29. Licensing and attribution are described in [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md).

## 1. Zork I source (historicalsource/zork1)

- Repository: https://github.com/historicalsource/zork1, commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd`. MIT License, Copyright (c) 2025 Microsoft.
- Files read for the port: `zork1.zil`, `gmain.zil`, `gparser.zil`, `gsyntax.zil`, `gverbs.zil`, `gglobals.zil`, `gclock.zil`, `gmacros.zil`, `1dungeon.zil` and `1actions.zil`.

## 2. Original story file

- `COMPILED/zork1.z3` from the same repository and commit: Release 119, Serial 880429, 86,838 bytes, SHA-256 `37084966477dff679282de42974b2077156b1bd68fad92a65d4ea94d8eb64d79`.
- The dictionary (684 words) and syntax table (267 lines) in `ERB/38_ParserTables.ERB` were read from this file.
- The story file itself is not part of ZORKERB.

## 3. Frotz (comparison interpreter)

- Frotz 2.56pre (dumb interface) ran the original story in a separate process during verification. It is not part of ZORKERB, and the game never calls it.

## 4. PyEmuera

- PyEmuera 3.0.0b2, https://github.com/Meistertech-JP/PyEmuera.
- `PyEmuera-3.0.0b2.pyz`, SHA-256 `8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb`, included unmodified.

## 5. Z-machine specification

- The Z-Machine Standards Document 1.1. Its description of the `random` opcode, including the predictable mode for seeds below 1000, is the basis of the sequential mode in `ERB/03_Random.ERB`.
