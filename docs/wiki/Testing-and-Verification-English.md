[日本語](Testing-and-Verification) | English

# Verification

The environment, methods, scope and results of the verification of ZORKERB r29.

The verification tools, test data, comparison interpreter, original story and raw reports are kept in the private development repository. This page summarises the confirmed results from those records.

## Environment

| Item | Value |
| --- | --- |
| Engine | PyEmuera 3.0.0b2, unmodified (SHA-256 `8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb`), the same file that is included here |
| OS and Python | Linux x86_64, Python 3.13 |
| Reference | The original story (Release 119 / Serial 880429, SHA-256 `37084966477dff679282de42974b2077156b1bd68fad92a65d4ea94d8eb64d79`) run under Frotz 2.56pre (dumb interface) |

There are no results for the Windows Emuera executable.

## Methods

### One frozen run

All checks run in a single pass:

1. At the start, the SHA-256 of the sources, tests and tools, the generated game and the engine are recorded.
2. Every check runs.
3. At the end, the run confirms that nothing has changed since step 1.

Any change to the sources means starting again from the beginning.

### Regression tests

1,596 cases run under the unmodified PyEmuera. The checks cover:

- text that must or must not appear in the output;
- state such as moves, score, object locations and flags;
- the contents of saves and the state after saving and restoring.

Expected results are based on the original game's responses and the source. The 38 expectations corrected in r29 were each confirmed by replaying the same input in the original.

### Comparison with the original

The same input goes to the original and to ZORKERB. Each response is compared, then the state saved at the end.

- **Aligned random sequence:** every case starts with the original's debugging command `#random 997`. Both programs then draw the same random numbers, so text and state can be compared exactly. Completion is judged on these comparisons.
- **Fixed seed:** a fixed seed alone does not give PyEmuera and Frotz the same random sequence. These results are recorded for reference.
- **Text normalisation:** only ASCII whitespace, including line breaks, and Frotz's hyphenated line wrapping are normalised. Wording is never normalised.
- **State comparison:** uses these values read from a save:
  - current location, score and moves;
  - the order of the inventory;
  - the parent/child relations and flags of the tracked objects;
  - IT.

  It does not establish that the whole memory is identical.

### Probes and the full route

- **Probes:** input sequences that compare specific scenes with the original step by step. They cover the Loud Room, the boat, the rope, the machine, every syntax line, and long sequences per region.
- **Full route:** a long treasure-collecting route compared step by step with the random sequence aligned.

### Complete game with ordinary input

559 inputs play from a new game to the ending. They use no SAVE, no RESTORE and no verification-only command.

## Results

| Check | Result |
| --- | --- |
| Regression tests | 1,596 of 1,596 pass (7,033 conditions, 1,985 state checks) |
| Save rejection | Pass: saves from r1–r19, r21–r25, r27 and r28, and deliberately corrupted saves, are rejected |
| Unit tests of the verification tools | 306 pass |
| Syntax tables | Equal to the tables read from the original story |
| Comparison with the original (aligned random sequence, 801 cases) | See below |
| Probes (41, 10,324 steps) | 10,320 steps exactly equal; 2 differ only in the save/restore file-name prompt; 2 are inputs over 120 characters |
| Full route (557 steps) | All 557 steps exactly equal |
| Complete game with ordinary input | Ending reached with 350 points in 613 moves |
| Mapping of source ROUTINEs | GAP 0 (VERIFIED 175, IMPLEMENTED 265, UNREFERENCED 1) |

### Comparison with the original by set

| Set | Cases | Text exactly equal | State equal |
| --- | ---: | ---: | ---: |
| pseudo | 56 | 56 | 56 |
| holdout | 62 | 62 | 62 |
| edges | 24 | 24 | 24 |
| older (18 sets from earlier revisions) | 659 | 657 | 657 |

The other 2 cases in "older" use `examine it` while IT refers to object 0. The original then runs `get_parent` and `test_attr` on object 0, and a strict interpreter stops.

- Rerun under a permissive interpreter (Frotz `-Z 1`), text, number of responses and state agree with ZORKERB, apart from the interpreter's warning lines.
- The steps before the stop (31 and 8) are exactly equal.
- These 2 cases are not counted as exact matches.

With a fixed seed, text was exactly equal in 69 of 142 cases and state in 142 of 142. The same 142 cases agree completely in text and state when the random sequence is aligned, so the text differences under a fixed seed are attributed to the different random sequences.

## Archive checks

The distributed files were checked for:

- the SHA-256, CRC and SHA256SUMS of the ZIP;
- no duplicate entries, unsafe paths or unwanted files;
- `ERB/` and `CSV/` byte-identical to the verified game;
- relative links in the documents resolving inside the distribution;
- the extracted distribution alone running this sequence: new game → take the leaflet → `save 0` → drop it → `restore 0` → the leaflet is held again → RESTART → SCORE → QUIT;
- the extracted distribution alone playing the 350-point route to the ending.
