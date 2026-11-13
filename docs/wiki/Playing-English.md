[日本語](Playing) | English

# Playing

ZORKERB I and ZORKERB II are text adventures played, as the originals, by typing English commands. This page covers the command forms, common commands, and saving and restoring.

## Command forms

Commands are short English sentences. Case does not matter.

| Form | Examples |
| --- | --- |
| Verb only | `look`, `inventory`, `wait` |
| Verb and object | `take lamp`, `open door`, `read leaflet` |
| Verb, object and preposition | `put coins in case`, `attack troll with sword`, `unlock grate with key` |
| Several objects | `take all`, `take lamp and sword`, `take all but sword` |
| Several commands | `open mailbox. take leaflet`, `north then east` |
| Orders to a character | name the character, as in `tell robot to ...` |

In the included games, input is parsed with the original story's dictionary and syntax rules. Unknown words get `I don't know the word "..."`. As in the originals, words are matched by their first six letters.

## Common commands

| Command | Meaning |
| --- | --- |
| `look` (`l`) | Describe the surroundings |
| `examine` *object* | Look at an object (`x` is not in the originals' dictionaries) |
| `inventory` (`i`) | List what you carry |
| `north`, `south`, `east`, `west`, `up`, `down`, `ne`, `nw`, `se`, `sw` (also `n`, `s` and so on) | Move |
| `take` *object*, `drop` *object* | Pick up, put down |
| `open` *object*, `close` *object* | Open, close |
| `turn on lamp` | Light the lamp |
| `again` (`g`) | Repeat the last command |
| `oops` *word* | Replace the unknown word in the last input |
| `score` | Show the score and moves |
| `verbose`, `brief`, `superbrief` | How much of a room description to show |
| `diagnose` | Check your health |
| `version` | Show the original's release information |

When the game asks "What do you want to ...?", you can answer with just the object's name.

## Saving and restoring

| To | Type |
| --- | --- |
| save | `save` (slot 0), `save 3` (slot 3) |
| restore during play | `restore`, `restore 3` |
| restore from the title screen | `1`, then the slot number |

- A successful save or restore prints `Ok.`, a failed one `Failed.`. Where the originals ask for a file name, the ports use slot numbers 0 to 9.
- `save` without a number overwrites slot 0.
- With PyEmuera, saves are written to `.pyemuera/saves/` inside the game folder (for example `ZORKERB-I/.pyemuera/saves/`). Each game keeps its own saves.
- A damaged save or one of another game is not loaded; during play this prints `Failed.` and nothing changes.
- Saves of the originals (Quetzal) are not compatible.

Differences between the games:

|  | ZORKERB I | ZORKERB II |
| --- | --- | --- |
| Saves of earlier revisions | Save format 29. Saves from r29 load; saves from r28 and earlier are rejected | First public release; there are no earlier revisions |

## Starting over and quitting

| Type | Effect |
| --- | --- |
| `restart` | Start over after a confirmation |
| `quit` | Quit after a confirmation |

After dying or winning you choose RESTART, RESTORE or QUIT, as in the originals.

## Random numbers

Combat, characters and other events use random numbers, drawn at the same places and in the same order as in the originals.

The originals' debugging command `#random` *number* switches to the Z-machine's predictable random mode; the same input then gives the same random sequence as the original.

|  | ZORKERB I | ZORKERB II |
| --- | --- | --- |
| Numbers | 1 to 999 (sequential mode) | 1 to 999 sequential mode; 1000 and above use the same generator as the Frotz used for comparison |

## The originals' own instructions

In ZORKERB I, the leaflet in the mailbox (`read leaflet`) explains how to play.
