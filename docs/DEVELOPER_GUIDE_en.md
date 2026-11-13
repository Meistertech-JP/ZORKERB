# Developer guide

The layout of the distribution and how to read, change and try out the ERB code. 日本語: [DEVELOPER_GUIDE_ja.md](DEVELOPER_GUIDE_ja.md)

## Layout

```text
PyEmuera-3.0.0.pyz        the engine, unmodified, shared by the included games
ZORKERB-I/ERB/, CSV/      ZORKERB I: the game
ZORKERB-I/docs/           ZORKERB I: implementation notes (architecture, source mapping)
ZORKERB-II/ERB/, CSV/     ZORKERB II: the game
docs/                     documents common to the included games
licenses/                 licenses and notices
```

ERB and ERH files are UTF-8 with a byte order mark.

## Generated and hand-written files

| Game | Generated | Everything else |
| --- | --- | --- |
| ZORKERB I | `00_Ids.ERH`, `10_World.ERB`, `38_ParserTables.ERB` (from the room and object definitions and the dictionary and syntax table read from the original story) | Hand-written source. Comments near the code name the corresponding ZIL routines |
| ZORKERB II | `00_Ids.ERH`, `10_World.ERB`, `79_Gen_Ints.ERB`/`.ERH`, `80_Gen_GVerbs.ERB` to `83_Gen_2Actions.ERB` (from the original ZIL and story; each file names its source at the top) | Hand-written source (parser, display, save checks, clock and so on) |

Editing generated files by hand can break the numbering and tables other files rely on. The generators are in the private development repository.

## Running and checking

Run these in the folder containing `PyEmuera-3.0.0.pyz`.

Start the game:

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
```

Run PyEmuera's static check (the game is not run):

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I --check
```

Run with input from a file. The first line is the title-screen choice (`0`); then one command per line:

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I --inputs replay.txt --no-wait
```

With `--inputs`, PyEmuera shows no input prompt; only the game's output and an echo of the input appear. `--seed` *number* fixes the random numbers. For the original's random sequence, make a command such as `#random 997` the game's first input.

See `python3 PyEmuera-3.0.0.pyz --help` and the PyEmuera documentation for its other features.

## Notes on changes

- **Keep the original logic:** responses and the order of processing follow the original ZIL. Where to find it: [Sources](SOURCES.md).
- Keep random draws through `Z_RANDOM` in `03_Random.ERB`, in the same places and order.
- Keep random draws through `Z2_RANDOM` in `03_Random.ERB`, in the same places and order.
- **Keep saves compatible:** changing the SAVEDATA variables (`01_State.ERH`) breaks existing saves; review the checks in `@EVENTLOAD` too.

Implementation: [architecture](../ZORKERB-I/docs/ARCHITECTURE_en.md), [ZIL to ERB mapping](../ZORKERB-I/docs/SOURCE_MAPPING_ja.md).
Implementation: [ZORKERB II README](../ZORKERB-II/README_en.md).

## Verification

Verification used test and comparison tools in the private development repository. The distribution contains neither those tools, nor the original story files, nor the comparison interpreter. Methods and results: [Verification](VERIFICATION_en.md).
