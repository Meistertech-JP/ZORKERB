# Compatibility and known limitations

This page covers ZORKERB r29. The original game is Zork I Release 119 / Serial 880429; the source is historicalsource/zork1 at commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd`.

## Run-time environments

| Environment | Status |
| --- | --- |
| PyEmuera 3.0.0b2 (unmodified, SHA-256 `8473b250…4bcb`), Linux x86_64, Python 3.13 | All verification was run in this environment; see [Verification](VERIFICATION_en.md). |
| PyEmuera 3.0.0b2 on other operating systems | The game uses no OS-dependent features. Terminal input and display follow PyEmuera and the terminal. |
| Emuera 1.824 (Windows) | Start-up, the title screen, a new game and the first five moves (`what`, `what is mailbox`, `take mailbox`, `open mailbox`, `read leaflet`) were observed; the responses matched the original. The regression tests and comparisons with the original were not run in this environment. |
| Other PyEmuera versions | Not verified. |

The game consists of ERB, ERH and CSV files only and does not call external programs or files at run time.

## What follows the original

- **Parser:** uses the story's own dictionary (684 words) and syntax table (267 lines), following the gparser.zil procedure. That covers the word scan, CLAUSE, SYNTAX-CHECK, GWIM, ORPHAN, and the handling of IT, ALL, AGAIN and OOPS.
- **Game logic:** rooms, objects, actions, timed events, combat, the thief, scoring, death and resurrection, and the ending. The mapping of the source's ROUTINEs is summarised in [Verification](VERIFICATION_en.md).
- **Random numbers:** drawn at the same points and in the same order as the original. `#random` *n* gives the same predictable sequence as the original.
- **Text:** the original text is printed unchanged; only line breaks differ.

## Known limitations

### Output that depends on the interpreter

In the following cases the original's output is decided by the Z-machine interpreter or its memory layout, so ZORKERB does not produce the same text.

- **Input lines longer than 120 characters:** like the original's input buffer, only the first 120 characters are read. The interpreter used for comparison (dfrotz) also reads words beyond the buffer and prints them from bytes outside it; ZORKERB does not reproduce this.
- **IT referring to object 0:** after drinking the water, or after the cyclops leaves, `examine it` makes the original operate on object 0.
  - A strict interpreter stops at that point.
  - A permissive interpreter prints a warning and then `I don't see what you are referring to.` ZORKERB prints that sentence, and its state matches that case.
- **SWIM without an object:** the original prints the name of object 0, whose text depends on the interpreter. ZORKERB prints the text of the interpreter used for comparison.

### Saves

- The save format is version 29. Saves from r28 and earlier cannot be restored.
- The original game's Quetzal saves are not supported.
- The original's file-name prompt is replaced by a slot number from 0 to 9. The save and restore responses (`Ok.`, `Failed.`) are the original's.

### Terminal display

- **Prompt:** with PyEmuera in an interactive terminal, PyEmuera's input line shows `> ` after the game's own `>`, so the prompt appears twice. When input is supplied from a file (`--inputs`), PyEmuera shows no input line. Emuera shows `>` once and echoes the input on the next line.
- **Line wrapping:** the game breaks long text at a fixed width. The breaks may fall in different places than in the original interpreter.

### Scope of state comparisons

State comparisons with the original use the following values, read from a save. They do not establish that the whole memory is identical.

- current location, score and moves
- the order of the inventory
- the parent/child relations and flags of the tracked objects
- IT
