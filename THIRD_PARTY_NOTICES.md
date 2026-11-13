# Third-party notices

ZORKERB contains unofficial eraBASIC (ERB/ERH/CSV) ports: ZORKERB I and ZORKERB II. They are not endorsed by Infocom, Microsoft, the authors of Emuera or the PyEmuera developers. Each component keeps its own terms.

## 1. ZORKERB

The ERB adaptations are Copyright (c) 2026 Meistertech-JP, under the MIT License (`LICENSE`).

## 2. Zork I

ZORK I: The Great Underground Empire — original game by Infocom.

ZORKERB I is based on the historicalsource/zork1 source distribution at commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd` (https://github.com/historicalsource/zork1). That distribution is provided under the MIT License, Copyright (c) 2025 Microsoft; the complete notice is in `licenses/ZORK1-MIT.txt`.

The game text printed by the ERB files of ZORKERB I is the original Zork I text from that source. The dictionary and syntax table in `ZORKERB-I/ERB/38_ParserTables.ERB` were read from the compiled story `COMPILED/zork1.z3` of the same commit. Both remain under Microsoft's MIT License.

## 3. Zork II

ZORK II: The Wizard of Frobozz — original game by Infocom.

ZORKERB II is based on the historicalsource/zork2 source distribution at commit `3da9661098809788a99cef00f00c865c6c204f96` (https://github.com/historicalsource/zork2). That distribution is provided under the MIT License, Copyright (c) 2025 Microsoft; the complete notice is in `licenses/ZORK2-MIT.txt`. The port follows Release 63 / Serial 860811 (story SHA-256 `3ae7d5558943e9721f3e4b273c8a7faec1a03a604e1ae4ee1cde472c21cb24ac`).

The game text printed by the ERB files of ZORKERB II, and the ERB generated from the ZIL routines, derive from that source and remain under Microsoft's MIT License.

## 4. PyEmuera

`PyEmuera-3.0.0.pyz` is PyEmuera 3.0.0 (https://github.com/Meistertech-JP/PyEmuera), SHA-256 `8a7b3697b97155c4dc994c8349c6756bb0401000d3bbccd8e85ff046e3774b35`, included unmodified. The included games use this one file.

- PyEmuera is released under the MIT License, Copyright (c) 2026 PyEmuera contributors.
- Parts of it were written by studying the Emuera source and remain subject to the Emuera license.
- It also contains Microsoft MIT-licensed reference source, Microsoft Open Specifications data and Unicode data under their own terms.

The license texts and notices are inside the `.pyz` file. Byte-for-byte copies are in `licenses/PyEmuera/`:

| File | Contents |
| --- | --- |
| `licenses/PyEmuera/LICENSE` | PyEmuera MIT License |
| `licenses/PyEmuera/THIRD_PARTY_NOTICES.md` | PyEmuera third-party notices |
| `licenses/PyEmuera/THIRD_PARTY_MS_NLS_NOTICE_ja.md` | Notice for the Microsoft sorting data |
| `licenses/PyEmuera/licenses/Emuera1824.txt` | Emuera license |
| `licenses/PyEmuera/licenses/MICROSOFT_REFERENCE_SOURCE_MIT.txt` | Microsoft Reference Source MIT License |
| `licenses/PyEmuera/licenses/UNICODE_LICENSE_V3.txt` | Unicode License V3 |
| `licenses/PyEmuera/pyemuera/resources/MS_OPEN_SPECIFICATIONS_NOTICE.txt` | Notice for the Microsoft Open Specifications data |

## 5. Names and trademarks

The MIT Licenses of the original sources and of ZORKERB cover copyright only; they do not grant rights to use any trademark. Names such as "Zork" and "Infocom" may be trademarks of their respective owners. ZORKERB uses these names only to identify and describe the work. It contains no official logos, box art, packaging or marketing material.

## 6. Not included

No Emuera executable or source, Frotz or other Z-machine interpreter, original story file, ZIL source, save file, font, or development or verification tool is included.
