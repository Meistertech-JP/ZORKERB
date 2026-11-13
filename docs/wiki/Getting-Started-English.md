[日本語](Getting-Started) | English

# Getting started

How to obtain and start ZORKERB I and ZORKERB II and play the first few moves.

## Requirements

- Python 3.10 or later (not included)
- ZORKERB itself (the distribution ZIP or the repository)

The included games run on the one included `PyEmuera-3.0.0.pyz` (PyEmuera 3.0.0, unmodified).

```text
8a7b3697b97155c4dc994c8349c6756bb0401000d3bbccd8e85ff046e3774b35  PyEmuera-3.0.0.pyz
```

## 1. Get the games

Extract the distribution ZIP into a new folder, or clone the repository. Do not extract over an earlier revision.

```text
ZORKERB/
├── PyEmuera-3.0.0.pyz     the engine shared by the included games
├── ZORKERB-I.bat          starts ZORKERB I (Windows)
├── ZORKERB-II.bat         starts ZORKERB II (Windows)
├── ZORKERB-I/             ZORKERB I: the game (ERB/, CSV/) and its documents
├── ZORKERB-II/            ZORKERB II: the game (ERB/, CSV/) and its documents
├── docs/                  documents common to the included games
└── licenses/              licenses and notices
```

## 2. Start a game

**Windows:** double-click `ZORKERB-I.bat` or `ZORKERB-II.bat`. If Python is not found, the batch says so and stops.

**Elsewhere:** in the folder that holds `PyEmuera-3.0.0.pyz`, name the game folder:

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
python3 PyEmuera-3.0.0.pyz ZORKERB-II
```

Use `python` if your system has no `python3` command.

## 3. Title screen

```text
ZORK I: The Great Underground Empire
ZORKERB r30 -- Native eraBASIC port
Original game: Infocom.
[0] New game  [1] Restore  [9] Quit
```

In ZORKERB II the first line is `ZORK II: The Wizard of Frobozz` and the second `ZORKERB II -- Native eraBASIC port`.

Enter `0` for a new game, `1` to restore a saved game, `9` to quit.

## 4. First moves (ZORKERB I)

```text
West of House
You are standing in an open field west of a white house, with a boarded
front door.
There is a small mailbox here.
>open mailbox
Opening the small mailbox reveals a leaflet.
>take leaflet
Taken.
```

ZORKERB II starts `Inside the Barrow`. Commands are typed in English. See [Playing](Playing-English) for the main commands, saving and restoring.

## 5. Quit

Type `quit` and answer `y`. To continue later, `save` first.

## Seeing `>` twice in a terminal

Besides the game's `>`, PyEmuera shows its own `> ` input prompt. Seeing two is only a display overlap and does not affect the game. See [Compatibility and limitations](Compatibility-and-Limitations-English).
