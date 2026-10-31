[日本語](Saving-and-Restoring) | English

# Saving and restoring

| Action | Input |
| --- | --- |
| Save | `save` (slot 0), `save 3` (slot 3) |
| Restore during play | `restore`, `restore 3` |
| Restore from the title screen | enter `1`, then the slot number |

- A successful save prints `Ok.`; a failure prints `Failed.`. The slot number (0–9) takes the place of the file name the original game asks for.
- `save` without a number overwrites slot 0.
- The save format is version 29. Saves from r28 and earlier and the original game's Quetzal saves cannot be restored.
- Saves are written to `.pyemuera/` inside the game folder (PyEmuera's behaviour).
