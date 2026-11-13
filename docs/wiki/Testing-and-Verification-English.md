[日本語](Testing-and-Verification) | English

# Verification

The environment, methods, scope and results of the verification of ZORKERB I and ZORKERB II.

The tools, test data, comparison interpreter, original story files and raw reports are kept in the private development repository. This page summarizes only confirmed results from those records. The results cover what was tested; they do not guarantee identical behaviour on every path of the originals.

## Environment

| Item | Details |
| --- | --- |
| Engine | PyEmuera 3.0.0 (unmodified, SHA-256 `8a7b3697b97155c4dc994c8349c6756bb0401000d3bbccd8e85ff046e3774b35`), the engine used for these recorded results |
| System and Python | Linux x86_64, Python 3.13 |
| Reference (I) | the original story (Release 119 / Serial 880429, SHA-256 `37084966477dff679282de42974b2077156b1bd68fad92a65d4ea94d8eb64d79`) |
| Reference (II) | the original story (Release 63 / Serial 860811, SHA-256 `3ae7d5558943e9721f3e4b273c8a7faec1a03a604e1ae4ee1cde472c21cb24ac`) |
| Interpreter for the originals | Frotz 2.56pre (dumb interface; the same executable for the included games) |

Checks on the native Emuera (Windows) are in [Compatibility and limitations](Compatibility-and-Limitations-English).

## Methods (the included games)

### One frozen run

1. At the start, the SHA-256 of the sources, tests, tools, built game and engine are recorded.
2. All checks run.
3. At the end, nothing may have changed from the recorded values. A source change means starting over.

### Comparison with the original

The same input is given to the original and the port, and each move's response is compared.

- **Aligned random sequences:** the input starts with the originals' debugging command `#random` *number*, so both draw the same sequence, and text and state are compared exactly. Completion is judged on this comparison.
- **Text normalization:** only ASCII whitespace (including where lines break) and Frotz's hyphenated line breaks. No wording is normalized.
- **State comparison:** location, score, moves, inventory order, selected object parents and flags, and IT, read from saves. This does not compare the whole memory.
- **State comparison:** before every input, the original's memory (all 251 object locations and attributes, globals, clock) against the port. Exclusions and reasons are recorded; the whole memory is not compared.

## ZORKERB I results

| Check | Result |
| --- | --- |
| Regression tests | 1,596 of 1,596 PASS (7,033 assertions, 1,985 state checks). Expectations rest on the original's responses and the source |
| Save rejection | PASS: saves of r1–r19, r21–r25, r27, r28 and deliberately damaged saves are rejected |
| Unit tests of the tools | 306 PASS |
| Syntax table | equal to the table read from the original story |
| Comparison with the original (aligned, 801 runs) | table below |
| Probes (41, 10,324 moves) | 10,320 exactly equal; 2 differ in the file-name prompt of SAVE and RESTORE; 2 are inputs over 120 characters |
| Full route (557 moves) | all 557 exactly equal |
| Ordinary-input playthrough | the endgame at 350 points in 613 moves, without SAVE, RESTORE or debugging commands |
| Routine mapping | GAP 0 (VERIFIED 175, IMPLEMENTED 265, UNREFERENCED 1); see the [ZIL to ERB mapping](Original-Source) (Japanese) |

| Set | Runs | Text exactly equal | State equal |
| --- | ---: | ---: | ---: |
| pseudo | 56 | 56 | 56 |
| holdout | 62 | 62 | 62 |
| edges | 24 | 24 | 24 |
| older (18 sets of earlier revisions) | 659 | 657 | 657 |

The two remaining older runs use `examine it` while IT points at object 0. The original then runs instructions on object 0, and a strict interpreter stops there. Rerun on a lenient interpreter (Frotz `-Z 1`), text, number of responses and state agree apart from the interpreter's warning line. These two are not counted as exact matches.

## ZORKERB II results

| Check | Result |
| --- | --- |
| Comparison with the original | the same text in 240 runs, 74,130 compared steps |
| Random numbers | 47,650 random calls agree in order, value and calling routine (predictable mode, every value compared) |
| State | at 74,114 points, the state read from the original's memory equals the port's |
| Playthrough | the 400-point route completed |
| Saving and restoring | saving in 10 slots and restoring in a new process; the comparison with the original's SAVE and RESTORE agrees |
| Routine mapping | every one of the original's 439 routines has an implementation (370 generated from the ZIL, the rest written by hand) |
| Spells and interrupts | all 12 spells and all 23 clock interrupts reached in tests |
| Branch coverage | 1,689 of the 2,648 ERB branches (63.8%) reached; the others are listed in the development records |

### Independent audits

An auditor separate from the developer checked:

| Audit | Result |
| --- | --- |
| The distribution | PASS: SHA-256 of the files, the included notices, the static check, the 400-point route in the extracted game, three save formats, restoring slots 0–9 in separate processes |
| Direct comparison with the original | the auditor ran the pinned original story on Frotz afresh: 10 routes, all 1,718 responses equal |
| Rebuild from the original ZIL | regenerated from the ZIL and the story: the 8 generated files and the 23 game files of the distribution are byte-identical (the same in two runs) |
| Recount of the records | 47,650 random draws and 74,114 state points recounted without the developer's tools: equal |

## Checks of the distribution

- The ZIP's SHA-256, `SHA256SUMS.txt` inside it, and no duplicate, unsafe or development file
- Each game's `ERB/` and `CSV/` byte-identical to the verified game; the included PyEmuera has the SHA-256 above
- Relative links in the documents resolve inside the distribution
- In the extracted distribution, the commands of the included start batches start each game
