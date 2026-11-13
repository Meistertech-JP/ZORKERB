# Wiki sources

`docs/wiki/` holds the sources of the ZORKERB wiki in Japanese and English: 22 pages, `_Sidebar.md` and `_Footer.md`. Links between pages use GitHub Wiki page names (for example `Getting-Started`), not repository paths. English pages end in `-English`.

The documents are the originals. These pages are generated from them by `tools/build_wiki.py` in the development repository (a language switch is added and links become page names):

| Wiki page | Document |
| --- | --- |
| Getting-Started | `docs/GETTING_STARTED_ja.md`, `_en.md` |
| Playing | `docs/PLAYING_ja.md`, `_en.md` |
| Compatibility-and-Limitations | `docs/COMPATIBILITY_ja.md`, `_en.md` |
| Testing-and-Verification | `docs/VERIFICATION_ja.md`, `_en.md` |
| Developer-Guide | `docs/DEVELOPER_GUIDE_ja.md`, `_en.md` |
| Architecture | `ZORKERB-I/docs/ARCHITECTURE_ja.md`, `_en.md` |
| Original-Source (Japanese) | `ZORKERB-I/docs/SOURCE_MAPPING_ja.md` |
| ZORKERB-II | `ZORKERB-II/README_ja.md`, `README_en.md` |

Written by hand: Home, Saving-and-Restoring (the saving section of Playing, as its own page), License-and-Attribution, Original-Source-English, `_Sidebar.md` and `_Footer.md`. When a document changes, regenerate the pages and review the hand-written ones.

Changes here do not update the published wiki. The wiki is a separate Git repository and is updated separately.
