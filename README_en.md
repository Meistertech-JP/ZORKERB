# ZORKERB

**r29** · [日本語](README.md)

ZORKERB is a port of Infocom's text adventure *ZORK I: The Great Underground Empire* (Release 119 / Serial 880429) to eraBASIC (ERB, ERH and CSV), the scripting language of the Emuera engine family.

## Relationship to the original game

The port is based on the Zork I ZIL source that Microsoft released under the MIT License ([historicalsource/zork1](https://github.com/historicalsource/zork1), commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd`). Rooms, objects, the parser, combat, timed events and scoring are reimplemented in ERB. The original English game text is used as-is.

ZORKERB is not an official release of, or endorsed by, Infocom, Microsoft or the authors of Emuera.

## A native eraBASIC port

All game logic is written in ERB. At run time the game uses no Z-machine interpreter, no original story file and no separate game implementation written in Python.

The game runs on the included Emuera-compatible engine [PyEmuera](https://github.com/Meistertech-JP/PyEmuera) 3.0.0b2.

## Requirements and running the game

- Python 3.10 or later (required by PyEmuera).
- The included `PyEmuera-3.0.0b2.pyz` is the unmodified PyEmuera 3.0.0b2 (SHA-256 `8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb`).

In this folder (the one containing `ERB/` and `CSV/`), run:

```console
python PyEmuera-3.0.0b2.pyz .
```

Enter `0` on the title screen to start a new game. See [Getting started](docs/GETTING_STARTED_en.md).

## Playing, saving and restoring

Commands are typed in English, for example `look`, `open mailbox`, `take leaflet`, `north`, `inventory` or `score`.

| Action | Command |
| --- | --- |
| Save | `save 3` saves to slot 3 (slots 0–9). Without a number, slot 0 is used. |
| Restore | `restore 3` during play, or `[1] Restore` on the title screen. |
| Start over | `restart` |
| Quit | `quit` |

The save format is version 29. Saves from earlier revisions and the original game's Quetzal saves cannot be restored.

See [Playing](docs/PLAYING_en.md).

## Compatibility and known limitations

Revision r29 has been verified under PyEmuera 3.0.0b2 with:

- the full regression suite of 1,596 cases;
- comparisons against the original story using the same random number sequence;
- a complete game reaching the ending with 350 points in 613 moves, using ordinary commands only.

A few paths whose output depends on the original interpreter, such as input lines longer than 120 characters, do not produce the same text as the original. The game has not been verified with the Windows Emuera executable.

For details, see:

- [Compatibility and known limitations](docs/COMPATIBILITY_en.md)
- [Verification](docs/VERIFICATION_en.md)

## Documents

| Document | Contents |
| --- | --- |
| [Developer guide](docs/DEVELOPER_GUIDE_en.md) | Layout, running and checking, notes for changes |
| [Architecture](docs/ARCHITECTURE_en.md) | Structure of the ERB implementation |
| [Sources](docs/SOURCES.md) | The original source and verification references |
| [Release notes](RELEASE_NOTES.md) | Changes in r29 (Japanese and English) |
| [Changelog](CHANGELOG.md) | Changes by revision |
| [Wiki sources](docs/wiki/Home-English.md) | Source pages for the project wiki |

The ZIL-to-ERB mapping is in Japanese ([docs/SOURCE_MAPPING_ja.md](docs/SOURCE_MAPPING_ja.md)).

## License and notices

The ZORKERB ERB code is released under the MIT License, Copyright (c) 2026 Meistertech-JP ([LICENSE](LICENSE)).

The original Zork I source and game text are under Microsoft's MIT License, Copyright (c) 2025 Microsoft ([licenses/ZORK1-MIT.txt](licenses/ZORK1-MIT.txt)).

The included PyEmuera is under the MIT License. Emuera-derived and other parts keep their own terms ([licenses/PyEmuera/](licenses/PyEmuera/LICENSE)).

See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
