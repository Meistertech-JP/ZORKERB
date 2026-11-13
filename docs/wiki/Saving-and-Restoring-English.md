[日本語](Saving-and-Restoring) | English

# Saving and restoring

| To | Type |
| --- | --- |
| save | `save` (slot 0), `save 3` (slot 3) |
| restore during play | `restore`, `restore 3` |
| restore from the title screen | `1`, then the slot number |

- A successful save or restore prints `Ok.`, a failed one `Failed.`. Where the originals ask for a file name, the ports use slot numbers 0 to 9.
- `save` without a number overwrites slot 0.
- With PyEmuera, saves are written to `.pyemuera/saves/` inside the game folder (for example `ZORKERB-II/.pyemuera/saves/`). The two games keep separate saves.
- A damaged save or one of another game is not loaded; during play this prints `Failed.` and nothing changes.
- Saves of the originals (Quetzal) are not compatible.

Differences between the games:

| | ZORKERB I | ZORKERB II |
| --- | --- | --- |
| Saves of earlier revisions | Save format 29. Saves from r29 load; saves from r28 and earlier are rejected | First public release; there are no earlier revisions |

All commands are in [Playing](Playing-English).
