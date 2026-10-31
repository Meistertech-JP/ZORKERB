# Developer guide

This guide covers the layout of this distribution and how to read, change and try out the ERB code. See [Architecture](ARCHITECTURE_en.md) for the structure of the implementation.

## Layout

```text
ERB/                      the game (ERB and ERH)
CSV/GameBase.csv          game title, code and version
PyEmuera-3.0.0b2.pyz      the engine, unmodified
docs/                     user and developer documents, wiki sources
licenses/                 Zork I and PyEmuera licenses and notices
```

## Kinds of ERB files

| Kind | Files | Notes |
| --- | --- | --- |
| Generated | `00_Ids.ERH`, `10_World.ERB`, `38_ParserTables.ERB` | Generated from the room and object definitions and from the dictionary and syntax table read from the original story. Editing them by hand can break the numbering and tables that other files rely on. |
| State declarations | `01_State.ERH` | The SAVEDATA variables make up save format 29. Adding or changing them breaks compatibility with existing saves. |
| Everything else | `02_Flow.ERB` to `91_Forest.ERB` | Hand-written source. Comments near the code name the corresponding ZIL routines. |

ERB and ERH files are UTF-8 with a byte order mark.

## Running and checking

Start the game:

```console
python PyEmuera-3.0.0b2.pyz .
```

Run PyEmuera's static check (the game is not run):

```console
python PyEmuera-3.0.0b2.pyz . --check
```

Run with input from a file. The first line is the title-screen choice (`0`); each following line is one command:

```console
python PyEmuera-3.0.0b2.pyz . --inputs replay.txt --no-wait
```

With `--inputs`, PyEmuera shows no input line; only the game's output and the echoed input appear. `--seed` *n* fixes the engine's random numbers. To get the original game's random sequence, start the game input with a command such as `#random 997`.

For other PyEmuera features, see `python PyEmuera-3.0.0b2.pyz --help` and the PyEmuera documentation.

## When changing the code

- **Keep the original behaviour.** Responses and the order of processing follow the original ZIL source, which is available at https://github.com/historicalsource/zork1/tree/97b7b3d68c075dd9af7da499c3e9690ada3471fd.
- **Keep the random draws.** Random numbers are drawn only through `Z_RANDOM` in `03_Random.ERB`. Changing where or in which order they are drawn breaks the match with the original's random sequence.
- **Keep save compatibility.** When you change SAVEDATA variables, review the checks in `@EVENTLOAD` and the value of `Z_SCHEMA`.

## Verification

r29 was verified with test and comparison tools kept in the private development repository. This distribution does not include those tools, the original story file or the comparison interpreter. The methods and confirmed results are in [Verification](VERIFICATION_en.md).
