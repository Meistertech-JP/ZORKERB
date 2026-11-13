# Sources

References used to build and verify ZORKERB I and ZORKERB II. Licensing and attribution are in [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md).

## 1. Zork I source (historicalsource/zork1)

- Repository: https://github.com/historicalsource/zork1, commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd`. MIT License, Copyright (c) 2025 Microsoft.
- Files read for the port: `zork1.zil`, `gmain.zil`, `gparser.zil`, `gsyntax.zil`, `gverbs.zil`, `gglobals.zil`, `gclock.zil`, `gmacros.zil`, `1dungeon.zil` and `1actions.zil`.
- Original story: `COMPILED/zork1.z3` of the same commit, Release 119, Serial 880429, 86,838 bytes, SHA-256 `37084966477dff679282de42974b2077156b1bd68fad92a65d4ea94d8eb64d79`. The dictionary (684 words) and syntax table (267 lines) in `ZORKERB-I/ERB/38_ParserTables.ERB` were read from it.

## 2. Zork II source (historicalsource/zork2)

- Repository: https://github.com/historicalsource/zork2, commit `3da9661098809788a99cef00f00c865c6c204f96`. MIT License, Copyright (c) 2025 Microsoft.
- The ZIL files of the game (`zork2.zil`, `gmain.zil`, `gparser.zil`, `gsyntax.zil`, `gverbs.zil`, `gglobals.zil`, `gclock.zil`, `gmacros.zil`, `2dungeon.zil`, `2actions.zil`); 370 of the 439 routines were translated by a generator, the rest by hand.
- Original story: `COMPILED/zork2.z3` of the same commit, Release 63, Serial 860811, 92,524 bytes, SHA-256 `3ae7d5558943e9721f3e4b273c8a7faec1a03a604e1ae4ee1cde472c21cb24ac`.

The story files and the ZIL sources are not part of ZORKERB.

## 3. Frotz (comparison interpreter)

- Frotz 2.56pre (dumb interface) ran the original stories in a separate process during verification. It is not part of ZORKERB, and the games never call it.

## 4. PyEmuera

- PyEmuera 3.0.0, https://github.com/Meistertech-JP/PyEmuera.
- `PyEmuera-3.0.0.pyz`, SHA-256 `8a7b3697b97155c4dc994c8349c6756bb0401000d3bbccd8e85ff046e3774b35`, included unmodified.

## 5. Z-machine specification

- The Z-Machine Standards Document 1.1. Its description of the `random` opcode, including the predictable mode for seeds below 1000, is the basis of the sequential mode in the included games' `03_Random.ERB`.
