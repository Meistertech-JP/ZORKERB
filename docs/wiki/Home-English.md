[日本語](Home) | English

# ZORKERB Wiki

ZORKERB ports Infocom's text adventures to eraBASIC (ERB, ERH and CSV). This repository holds two games.

| Game | Original | Revision | Source |
| --- | --- | --- | --- |
| ZORKERB I | ZORK I: The Great Underground Empire (Release 119 / Serial 880429) | r30 | [historicalsource/zork1](https://github.com/historicalsource/zork1) `97b7b3d6…` |
| ZORKERB II | ZORK II: The Wizard of Frobozz (Release 63 / Serial 860811) | first public release (repository revision r30) | [historicalsource/zork2](https://github.com/historicalsource/zork2) `3da96610…` |

- All game logic is written in ERB. Both games run on one shared PyEmuera 3.0.0 (`PyEmuera-3.0.0.pyz` at the repository root); no Z-machine interpreter and no original story file are used at run time.
- On Windows, double-click `ZORKERB-I.bat` or `ZORKERB-II.bat`.

ZORKERB is not an official release of, and is not endorsed by, Infocom, Microsoft, the authors of Emuera or the PyEmuera developers.

## Play

- [Getting started](Getting-Started-English): requirements, starting, the title screen (both games).
- [ZORKERB II](ZORKERB-II-English): ZORKERB II in brief, what was checked, known limitations.
- [Playing](Playing-English), [Saving and restoring](Saving-and-Restoring-English): both games.
- [Compatibility and limitations](Compatibility-and-Limitations-English): what was checked in which environment, and where the ports differ (both games).

## Develop

- [Developer guide](Developer-Guide-English): layout, running and checking, notes on changes (both games).
- [Verification](Testing-and-Verification-English): methods and results for both games.
- [Architecture](Architecture-English): structure of the ZORKERB I ERB implementation.
- [Original source and ERB](Original-Source-English): ZORKERB I ZIL files, ERB files and routines.

## Project

- [License and attribution](License-and-Attribution-English)
- [日本語 Home](Home)
