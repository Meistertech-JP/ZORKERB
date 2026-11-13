[日本語](ZORKERB-II) | English

# ZORKERB II

A port of Infocom's text adventure *ZORK II: The Wizard of Frobozz* to eraBASIC (ERB, ERH and CSV). Common information is described in the top-level [README](Home-English) and in [docs/](Getting-Started-English).

## About

| Item | Details |
| --- | --- |
| Original | ZORK II: The Wizard of Frobozz (Release 63 / Serial 860811) |
| Source | [historicalsource/zork2](https://github.com/historicalsource/zork2), ZIL source at commit `3da9661098809788a99cef00f00c865c6c204f96` |
| Revision | first public release |

The original source code (ZIL) carried over to eraBASIC. The rules, text, parser, clock events and use of random numbers follow the original source. Of the original's 439 routines, 370 were generated from the ZIL and the rest written by hand. It is not a Z-machine emulator: no original story file and no Z-machine interpreter are used at run time.

## Starting

On Windows, double-click `ZORKERB-II.bat` at the top level. Elsewhere, run at the top level (where `PyEmuera-3.0.0.pyz` is):

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-II
```

Enter `0` on the title screen to start a new game. See [Getting started](Getting-Started-English) for the first steps and [Playing](Playing-English) for commands, saving and restoring.

## About this game

- Saves are written to `.pyemuera/saves/` in this folder. When played on the native Emuera, saves use Emuera's own format and are not interchangeable with PyEmuera's.
- **The Fantasize illusion:** while the spell is active, looking into an open container you are not carrying makes the original stop with `Fatal error: Store out of dynamic memory`. The port ends at the same point with the same message; this is the original's own behaviour. Save before trying it.
- On the native Emuera, loading a truncated save file stops with an engine error. Do not edit save files.
- Other limitations, and what was checked in which environment: [Compatibility and limitations](Compatibility-and-Limitations-English).

## What was checked

The pinned original story was run under Frotz and compared with the port given the same input:

- the same text in 240 runs with 74,130 compared steps; 47,650 random calls and the internal state at 74,114 points agree too;
- the 400-point route, and saving in 10 slots with restoring in a new process;
- an independent audit confirmed a direct comparison with the original (10 routes, 1,718 responses) and a rebuild from the original ZIL (game files byte-identical);
- on the native Emuera1824+v24 (Windows), 11 automatic replays including saves and restores matched, apart from host display differences such as line wrapping.

These are results of finite tests, not a proof of complete compatibility; some branches were never reached. Details: [Verification](Testing-and-Verification-English).

## Acknowledgements

*ZORK II* was created by Dave Lebling and Marc Blank and published by Infocom. Thanks to Microsoft for releasing the Zork II source under the MIT License, and to historicalsource/zork2 for preserving and publishing it.

## License

The ERB port is under the MIT License (Copyright (c) 2026 Meistertech-JP). The original Zork II source and text, and the ERB generated from the ZIL, are under Microsoft's MIT License (Copyright (c) 2025 Microsoft). See [THIRD_PARTY_NOTICES.md](License-and-Attribution) at the top level.
