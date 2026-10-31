[日本語](Original-Source) | English

# Original source and ERB

## Source

ZORKERB r29 is based on the ZIL source of historicalsource/zork1 at commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd`, available at https://github.com/historicalsource/zork1/tree/97b7b3d68c075dd9af7da499c3e9690ada3471fd.

The original story used for comparisons is `COMPILED/zork1.z3` of the same commit (Release 119 / Serial 880429, SHA-256 `37084966477dff679282de42974b2077156b1bd68fad92a65d4ea94d8eb64d79`).

## Files

| ZIL file | Contents | Main ERB files |
| --- | --- | --- |
| `gparser.zil` | Parser (PARSER, CLAUSE, SYNTAX-CHECK, GWIM, ORPHAN, GLOBAL-CHECK) | `37_SourceParser`, `39_Dictionary`, `40_Parser`, `42_CommandStream`, `43_SyntaxChecks`, `49_Inference`, `58_PseudoObjects` |
| `gsyntax.zil` | Syntax table and verb definitions | `38_ParserTables` (read from the story), `41_Grammar` |
| `gmain.zil` | MAIN-LOOP, PERFORM | `42_CommandStream`, `50_Actions` |
| `gverbs.zil` | Default verb routines (V-, PRE-), SAVE, RESTORE, RESTART, QUIT, FINISH | `48_SimpleVerbs`, `52_SelfActions`, `55_GenericActions`, `57_AdditionalActions`, `59_SourceVerbs`, `02_Flow`, `87_Death` |
| `gglobals.zil` | Global objects and pseudo-objects | `52_SelfActions`, `54_GlobalActions`, `58_PseudoObjects` |
| `gclock.zil` | Interrupts and end of move | `90_Clock` |
| `gmacros.zil` | `RANDOM`, `PROB` and others | `03_Random` |
| `1dungeon.zil` | Rooms and objects | `00_Ids.ERH`, `10_World.ERB` (generated files) |
| `1actions.zil` | Room, object and character routines, combat, the thief | `46_ObjectOverrides`, `47_Water`, `53_SceneryActions`, `60_Puzzles`, `70`–`74`, `80`–`87`, `91_Forest` |

Comments in each ERB file name the corresponding ZIL routines.

## Mapping per ROUTINE

In the development environment, every ROUTINE of the source is listed with where it is implemented in the port, whether its strings are present, whether those strings were observed in comparisons with the original, and whether the source references it.

| Status | Count | Meaning |
| --- | ---: | --- |
| VERIFIED | 175 | A comparison with the original recorded the routine's text, and the port's response was equal |
| IMPLEMENTED | 265 | The strings are in the port, but no recorded comparison has produced them yet (includes routines without strings) |
| UNREFERENCED | 1 | Not used anywhere in the source (`UNTIE-FROM`: no syntax line names it) |
| GAP | 0 | Strings found neither in the port nor among recorded reasons |

GAP 0 means that every string of the source is in the port or has a recorded reason for being unreachable. It does not mean that every branch has been verified; see [Verification](Testing-and-Verification-English).

## Branches that are never reached

The source contains branches that Zork I never uses:

- branches for Zork II and III (selected by `ZORK-NUMBER`);
- commented-out sections;
- DEBUG output;
- flags that no Zork I object has, such as WEARBIT.

These are not ported.
