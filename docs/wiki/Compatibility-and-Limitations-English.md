[日本語](Compatibility-and-Limitations) | English

# Compatibility and limitations

Recorded checks and limitations of ZORKERB I and ZORKERB II.

## Environments

| Environment | ZORKERB I | ZORKERB II |
| --- | --- | --- |
| PyEmuera 3.0.0 (recorded verification version, unmodified, SHA-256 `8a7b3697…4b35`), Linux x86_64, Python 3.13 | All verification ran here ([Verification](Testing-and-Verification-English)) | All verification ran here ([Verification](Testing-and-Verification-English)) |
| PyEmuera 3.0.0, Windows | No record | Start-up, a new game and a few moves were checked; not a full play-through |
| PyEmuera 3.0.0, other systems | The game uses nothing system-dependent; terminal input and display follow PyEmuera and the terminal | The game uses nothing system-dependent; terminal input and display follow PyEmuera and the terminal |
| Native Emuera (Windows) | On Emuera 1.824, start-up, the title screen, a new game and the first five moves (`what`, `what is mailbox`, `take mailbox`, `open mailbox`, `read leaflet`) were checked; the responses matched the original. The regression tests and comparisons with the original were not run there | On Emuera1824+v24 (Windows 10), 11 automatic replays matched, apart from line wrapping and spaces at line ends. They include saving and restoring in text and binary format, random numbers with saves, the 400-point route and the original's fatal-error path. 11 manually checked items of normal play also passed |
| Other PyEmuera versions | Not verified | Not verified |

The included games are written only in ERB, ERH and CSV and call no external program or file at run time. They use no Z-machine interpreter and no original story file.

## What follows the originals

- **Parser:** the original story's dictionary and syntax table, parsed with the steps of the original gparser.zil (word scan, CLAUSE, SYNTAX-CHECK, GWIM, ORPHAN, IT, ALL, AGAIN, OOPS).
- **Game logic:** rooms, objects, actions, clock interrupts, combat, scoring, death and the endgame follow the original routines. Each game's documents map them.
- **Random numbers:** drawn at the same places and in the same order. With `#random` *number* the sequence is the original's predictable one.
- **Text:** the original text, unchanged; only line breaks differ.

## Limitations common to the included games

- **Prompt:** when PyEmuera is used interactively in a terminal, the game's `>` is followed by PyEmuera's own `> ` input prompt, so `>` appears twice. With input from a file (`--inputs`), PyEmuera shows no prompt.
- **Line wrapping:** line breaks may differ from the original interpreter's. The native Emuera wraps to its window width.
- **Saves:** saves of the originals (Quetzal) are not compatible. Where the originals ask for a file name, the ports use slot numbers 0 to 9; the responses (`Ok.`, `Failed.`) are the originals'. Saves of the native Emuera use Emuera's own format and are not interchangeable with PyEmuera's.
- **Interpreter-dependent places:** a few places in the originals give results that depend on the Z-machine interpreter. The ports give the results of the Frotz used for comparison.

## ZORKERB I

In these cases the original's output depends on the Z-machine interpreter or its memory layout, so the output differs:

- **Input lines over 120 characters:** as the original's input buffer, only the first 120 characters are read. The comparison interpreter (dfrotz) reads words beyond the buffer and prints them from bytes outside it; this is not reproduced.
- **IT pointing at object 0:** after drinking the water or after the cyclops has gone, `examine it` makes the original run instructions on object 0. A strict interpreter stops there; a lenient one prints a warning and then `I don't see what you are referring to.`. ZORKERB I prints that sentence, and its state matches that case.
- **SWIM with no object:** the original tries to print the name of object 0, which depends on the interpreter. ZORKERB I prints what the comparison interpreter printed.
- **Save format:** 29. Saves from r28 and earlier cannot be restored.

## ZORKERB II

- **The Fantasize illusion:** while the spell is active, looking into an open container you are not carrying makes the original print `There is a ` and stop with `Fatal error: Store out of dynamic memory`; the layout of the original's data table does not match the routine that reads it. The port ends at the same point with the same message. Save before trying it.
- **Truncated saves on the native Emuera:** loading a truncated save file on the native Emuera stops with an engine error (the game cannot prevent it). The other slots and the game files are unchanged. Do not edit save files.

## Scope of the state comparisons

The comparisons of game state with the original do not check the whole memory. What was compared is listed in [Verification](Testing-and-Verification-English).
