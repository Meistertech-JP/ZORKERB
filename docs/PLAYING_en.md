# Playing

ZORKERB is played like the original Zork I: you type short English commands. This page covers the command forms, common commands, and saving and restoring.

## Command forms

Commands are not case-sensitive.

| Form | Examples |
| --- | --- |
| Verb only | `look`, `inventory`, `wait` |
| Verb and object | `take lamp`, `open mailbox`, `read leaflet` |
| Verb, object and preposition | `put coins in case`, `attack troll with sword`, `unlock grate with key` |
| Several objects | `take all`, `take lamp and sword` |
| Several commands | `open mailbox. take leaflet`, `north then east` |
| Orders to a character | name the character, as in `tell cyclops to ...` |

Input is parsed with the original game's dictionary and syntax rules. Unknown words get `I don't know the word "..."`. As in the original, words are matched by their first six letters.

## Common commands

| Command | Meaning |
| --- | --- |
| `look` (`l`) | Describe the surroundings |
| `examine` *object* | Look at an object (`x` is not available) |
| `inventory` (`i`) | List what you carry |
| `north`, `south`, `east`, `west`, `up`, `down`, `ne`, `nw`, `se`, `sw` (also `n`, `s`, ...) | Move |
| `take` *object*, `drop` *object* | Pick up, put down |
| `open` *object*, `close` *object* | Open, close |
| `turn on lamp` | Light the lamp |
| `again` (`g`) | Repeat the previous command |
| `oops` *word* | Replace the unknown word in the previous input |
| `score` | Show the score and moves |
| `verbose`, `brief`, `superbrief` | Change how much room description is shown |
| `diagnose` | Report your health |
| `version` | Show the original game's release information |

`x` is not in the Release 119 dictionary; use `examine`.

## Saving and restoring

| Action | Input |
| --- | --- |
| Save | `save` (slot 0), `save 3` (slot 3) |
| Restore during play | `restore`, `restore 3` |
| Restore from the title screen | enter `1`, then the slot number |

- A successful save prints `Ok.`; a failure prints `Failed.`. The slot number (0–9) takes the place of the file name the original game asks for.
- `save` without a number overwrites slot 0.
- The save format is version 29. Saves from r28 and earlier and the original game's Quetzal saves cannot be restored.
- Saves are written to `.pyemuera/` inside the game folder (PyEmuera's behaviour).

## Restart and quit

| Input | Effect |
| --- | --- |
| `restart` | Start over after confirmation |
| `quit` | Quit after confirmation |

After death or victory you choose between RESTART, RESTORE and QUIT, as in the original.

## Random numbers

Combat, the thief and some other events use random numbers, drawn in the same order as in the original.

The original game's debugging command `#random` *n* (1–999) switches to the Z-machine's predictable random mode. In that mode the same input produces the same random sequence as the original game.

## The original instructions

The game's own introduction is on the leaflet in the mailbox at the start (`read leaflet`).
