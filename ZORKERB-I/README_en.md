# ZORKERB I

A port of Infocom's text adventure *ZORK I: The Great Underground Empire* to eraBASIC (ERB, ERH and CSV). Common information is described in the top-level [README](../README_en.md) and in [docs/](../docs/GETTING_STARTED_en.md). 日本語: [README_ja.md](README_ja.md)

## About

| Item | Details |
| --- | --- |
| Original | ZORK I: The Great Underground Empire (Release 119 / Serial 880429) |
| Source | [historicalsource/zork1](https://github.com/historicalsource/zork1), ZIL source at commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd` |
| Revision | r30 (the title screen shows `ZORKERB r30`), save format 29 |

## Starting

On Windows, double-click `ZORKERB-I.bat` at the top level. Elsewhere, run at the top level (where `PyEmuera-3.0.0.pyz` is):

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
```

Enter `0` on the title screen to start a new game. See [Getting started](../docs/GETTING_STARTED_en.md) for the first steps and [Playing](../docs/PLAYING_en.md) for commands, saving and restoring.

## About this game

- Saves are written to `.pyemuera/saves/` in this folder. Saves from r29 load; saves from r28 and earlier are rejected.
- Right after the start, the leaflet in the mailbox (`read leaflet`) explains how to play.
- Where the original's output depends on its interpreter (input lines over 120 characters and a few others), the output differs. The list is in [Compatibility and limitations](../docs/COMPATIBILITY_en.md).
- Verification results (1,596 regression tests, comparisons with the original, the 350-point playthrough and more) are in [Verification](../docs/VERIFICATION_en.md).

## Documents

| Document | Contents |
| --- | --- |
| [Architecture](docs/ARCHITECTURE_en.md) | Structure of the ERB implementation |
| [ZIL to ERB mapping](docs/SOURCE_MAPPING_ja.md) (Japanese) | Original files and routines against the ERB |
| [Release notes](RELEASE_NOTES.md) | Changes in r30 and r29 |
| [Changelog](CHANGELOG.md) | Changes by revision |

## Acknowledgements

*ZORK I* was created by Marc Blank, Dave Lebling, Bruce Daniels and Tim Anderson and published by Infocom. Thanks to Microsoft for releasing the Zork I source under the MIT License, and to historicalsource/zork1 for preserving and publishing it.

## License

The ERB port is under the MIT License (Copyright (c) 2026 Meistertech-JP). The original Zork I source and text are under Microsoft's MIT License (Copyright (c) 2025 Microsoft). See [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md) at the top level.
