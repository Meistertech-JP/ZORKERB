[日本語](Getting-Started) | English

# Getting started

How to obtain and start ZORKERB r29 and play the first few moves.

## Requirements

- Python 3.10 or later
- ZORKERB itself: `ERB/`, `CSV/` and the included `PyEmuera-3.0.0b2.pyz`

The included PyEmuera is the unmodified PyEmuera 3.0.0b2:

```text
8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb  PyEmuera-3.0.0b2.pyz
```

## 1. Get the game

Extract the distribution ZIP into a new folder, or clone the repository. Do not extract over an earlier revision; saves from earlier revisions cannot be restored in r29.

## 2. Start the game

In the folder that contains `ERB/` and `CSV/`, run:

```console
python PyEmuera-3.0.0b2.pyz .
```

Use `python3` if your system has no `python` command.

## 3. Title screen

```text
ZORK I: The Great Underground Empire
ZORKERB r29 -- Native eraBASIC port
Original game: Infocom.
[0] New game  [1] Restore  [9] Quit
```

Enter `0` for a new game, `1` to restore a saved game, or `9` to quit.

## 4. First moves

```text
West of House
You are standing in an open field west of a white house, with a boarded
front door.
There is a small mailbox here.
>open mailbox
Opening the small mailbox reveals a leaflet.
>take leaflet
Taken.
>read leaflet
```

Commands are typed in English. See [Playing](Playing-English) for common commands and for saving and restoring.

## 5. Quit

Type `quit` and answer `y` to the confirmation. Save first with `save` if you want to continue later.

## If `>` appears twice in a terminal

The game prints its own `>` prompt, and PyEmuera's input line in an interactive terminal shows `> ` as well. The two prompts are a display overlap only and do not affect the game. See [Compatibility and known limitations](Compatibility-and-Limitations-English).
