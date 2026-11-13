# ZORKERB

Ports of Infocom's text adventures (ZORKERB I and ZORKERB II) to Emuera-compatible eraBASIC (ERB, ERH and CSV). 日本語: [README.md](README.md)

| Game | Original | Start (Windows) | Details |
| --- | --- | --- | --- |
| ZORKERB I | ZORK I: The Great Underground Empire (Release 119 / Serial 880429) | `ZORKERB-I.bat` | [ZORKERB-I/README_en.md](ZORKERB-I/README_en.md) |
| ZORKERB II | ZORK II: The Wizard of Frobozz (Release 63 / Serial 860811) | `ZORKERB-II.bat` | [ZORKERB-II/README_en.md](ZORKERB-II/README_en.md) |

All game logic is written in ERB, rewritten from the original ZIL sources (released by Microsoft under the MIT License); the original English text is used unchanged. No Z-machine interpreter and no original story file are used at run time.

ZORKERB is an unofficial port. It is not an official release of, and is not endorsed by, Infocom and Microsoft.

## Starting

Python 3.10 or later is required.

- **Windows:** double-click `ZORKERB-I.bat` or `ZORKERB-II.bat`.
- **Elsewhere:** run in this folder:

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
python3 PyEmuera-3.0.0.pyz ZORKERB-II
```

Enter `0` on the title screen to start a new game. The included games run on `PyEmuera-3.0.0.pyz` in this folder (PyEmuera 3.0.0, unmodified, SHA-256 `8a7b3697b97155c4dc994c8349c6756bb0401000d3bbccd8e85ff046e3774b35`).

## Layout

```text
PyEmuera-3.0.0.pyz        the engine shared by the included games
ZORKERB-I.bat             starts ZORKERB I (Windows)
ZORKERB-II.bat            starts ZORKERB II (Windows)
ZORKERB-I/                ZORKERB I: the game (ERB/, CSV/), README, documents
ZORKERB-II/               ZORKERB II: the game (ERB/, CSV/), README
docs/                     documents common to the included games
licenses/                 licenses and notices
SHA256SUMS.txt            SHA-256 of every file
```

## Documents

| Document | Contents |
| --- | --- |
| [Getting started](docs/GETTING_STARTED_en.md) | Requirements, starting, the title screen |
| [Playing](docs/PLAYING_en.md) | Command forms, common commands, saving and restoring |
| [Compatibility and limitations](docs/COMPATIBILITY_en.md) | What was checked in which environment, and where the ports differ |
| [Verification](docs/VERIFICATION_en.md) | Verification methods and results |
| [Developer guide](docs/DEVELOPER_GUIDE_en.md) | Layout, running and checking, notes on changes |
| [Sources](docs/SOURCES.md) | Original sources and references |

## Verification

The pinned original stories were compared with the ports under Frotz. Results and scope: [Verification](docs/VERIFICATION_en.md).

## Acknowledgements

*ZORK I*: Marc Blank, Dave Lebling, Bruce Daniels and Tim Anderson; published by Infocom.
*ZORK II*: Dave Lebling and Marc Blank; published by Infocom.

Thanks to Microsoft and historicalsource for releasing and preserving the sources.

## License and attribution

- The ZORKERB ERB ports: MIT License, Copyright (c) 2026 Meistertech-JP ([LICENSE](LICENSE))
- Zork I source and text: MIT License, Copyright (c) 2025 Microsoft ([licenses/ZORK1-MIT.txt](licenses/ZORK1-MIT.txt))
- Zork II source and text: MIT License, Copyright (c) 2025 Microsoft ([licenses/ZORK2-MIT.txt](licenses/ZORK2-MIT.txt))
- PyEmuera 3.0.0: MIT License; Emuera-derived and other parts keep their own terms ([licenses/PyEmuera/](licenses/PyEmuera/LICENSE))

The MIT License covers copyright only and grants no trademark rights. Names such as "Zork" and "Infocom" may be trademarks of their respective owners; ZORKERB uses them only to describe the work. See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
