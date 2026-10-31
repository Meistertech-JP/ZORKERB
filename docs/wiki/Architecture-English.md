[日本語](Architecture) | English

# Architecture

The structure of the ZORKERB r29 ERB implementation. File names refer to `ERB/`.

## Overview

The game is entered through Emuera's system functions: `@SYSTEM_TITLE`, `@EVENTFIRST`, `@SHOW_SHOP` and `@EVENTLOAD`. One move of the original MAIN-LOOP is handled by `Z_READ_TURN`, which `@SHOW_SHOP` calls.

```text
@SYSTEM_TITLE (02_Flow)     title screen; new game, restore, quit; reinitialisation after RESTART
  └ @SHOW_SHOP (02_Flow)    input for each move; performs SAVE, RESTORE, RESTART and QUIT
      └ Z_READ_TURN (42_CommandStream)
          ├ reads input, splits sentences, handles quotations and orders to characters
          ├ parser (37–43, 49)
          ├ Z_PERFORM (50_Actions)     calls the ACTIONs in the original PERFORM order
          └ clock (90_Clock)          interrupts at the end of the move
@EVENTLOAD (02_Flow)         checks the save format and the restored state
```

## State and saves

- Game state lives in the variables declared in `01_State.ERH`. That covers object locations, flags, timers, random state and the parser's pending state.
- Only variables marked SAVEDATA are saved. Saving and loading use Emuera's `SAVEDATA`, `CHKDATA` and `LOADDATA`.
- `@EVENTLOAD` checks the save format (`Z_SCHEMA`) and the restored values. It abandons a load that fails these checks and returns to the title screen.

## World definition

Rooms and objects (110 rooms, 141 objects) are in two files generated from the development definitions:

- `00_Ids.ERH` (room and object numbers);
- `10_World.ERB` (initial placement and attributes).

`21_ObjectTree.ERB` maintains the object tree with the same ordering rules as the Z-machine's INSERT_OBJ and REMOVE_OBJ.

## Parser

| File | Role |
| --- | --- |
| `42_CommandStream.ERB` | Reading the input line (120 characters), sentence breaks (period, THEN), quotations, orders, AGAIN, OOPS |
| `37_SourceParser.ERB` | gparser.zil word scan, CLAUSE, SYNTAX-CHECK |
| `38_ParserTables.ERB` | Dictionary (684 words) and syntax table (267 lines) read from the original story; generated file |
| `39_Dictionary.ERB` | V3 dictionary matching (first six letters) |
| `40_Parser.ERB`, `41_Grammar.ERB` | Object resolution, verbs and prepositions |
| `43_SyntaxChecks.ERB` | TAKE-CHECK, ITAKE-CHECK and other syntax flags |
| `49_Inference.ERB` | GWIM (guessing objects) and narrowing candidates |
| `44_Speech.ERB` | SAY, TELL and orders to characters |
| `58_PseudoObjects.ERB` | GLOBAL-CHECK and pseudo-objects |

## Actions

`Z_PERFORM` in `50_Actions.ERB` follows the original PERFORM order:

1. objects that are not here;
2. the actor (WINNER);
3. the room's M-BEG;
4. the pre-action (PRE-);
5. the indirect object's ACTION;
6. the direct object's ACTION;
7. the verb's default routine.

| Files | Role |
| --- | --- |
| `46_ObjectOverrides`, `53_SceneryActions`, `54_GlobalActions` | Object ACTIONs |
| `45_MiscActions`, `48_SimpleVerbs`, `52_SelfActions`, `55_GenericActions`, `57_AdditionalActions`, `59_SourceVerbs` | Default verb routines (gverbs.zil) |
| `47_Water` | Water and containers |
| `56_Leap` | Jumping and falling |
| `60_Puzzles`, `72_Maze`, `80_Dam`–`85_EggEnd`, `91_Forest` | Regional puzzles: house, maze, dam, temple, river, mine, egg and ending, forest |
| `70_Combat`–`74_ThiefText`, `86_Thief` | Combat and the thief |
| `87_Death` | Death, scattering of possessions, actions while dead (DEAD-FUNCTION) |
| `90_Clock` | gclock.zil interrupt table and end of move |
| `30_Display`, `31_OracleResponses` | Room and object descriptions, inventory listings, shared responses |

## Random numbers

`03_Random.ERB` implements ZIL's `RANDOM` as the Z-machine does.

- **Normally:** values come from the engine's random generator.
- **After `#random` *N* (1–999):** the Z-machine standard's predictable sequential mode is used.

Draws happen at the same points and in the same order as in the original, so the sequential mode yields the original's random sequence.

## Generation and run time

| Stage | What is used |
| --- | --- |
| Generation | `00_Ids.ERH`, `10_World.ERB` and `38_ParserTables.ERB` were generated from definition data by Python tools in the development environment. All other ERB and ERH files are hand-written source. |
| Run time | ERB, ERH and CSV only. No Python code, story file or Z-machine interpreter. |
