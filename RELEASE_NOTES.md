# ZORKERB r29

## 日本語

ZORKERB r29 は、ZORK I: The Great Underground Empire（Release 119 / Serial 880429）を eraBASIC（ERB・ERH・CSV）で書き直した移植の版です。原典は historicalsource/zork1 のコミット `97b7b3d68c075dd9af7da499c3e9690ada3471fd` です。

### 変更内容

- **構文解析：** 原作 story の辞書（684語）と構文表（267行）を使い、gparser.zil の手順（語の走査、CLAUSE、SYNTAX-CHECK、GWIM、ORPHAN）で解析するようにしました。辞書にない語（`x` など）は、原作と同じく `I don't know the word` と答えます。
- **語彙と動詞：** 原作の辞書にあって以前の版で使えなかった動詞（`sit`、`roll`、`slide`、`leave`、`exit`、`lean`、`spin`、`hatch`、`send`、`pump`、`wear`、`play` など）を、原典の処理に従って追加しました。
- **乱数：** 原作と同じ箇所・同じ順序で引くようにしました。原作のデバッグ命令 `#random 数` で、Z-machine の予測可能な乱数モードを使えます。
- **表示と終了処理：** 部屋・所持品・入れ物の中身の表示、死亡や勝利の後の RESTART・RESTORE・QUIT、QUIT と RESTART の確認、得点の表示を原作の文と手順に合わせました。
- **入力：** 入力バッファ（120文字）、Loud Room の入力ループ、OOPS・AGAIN、引用符と人物への指示を原作に合わせました。
- **応答：** 原作との比較で見つかった違いを、原典の処理に基づいて直しました。
- **タイトル：** 開発版の表記をやめ、次の表示にしました。

  ```text
  ZORK I: The Great Underground Empire
  ZORKERB r29 -- Native eraBASIC port
  Original game: Infocom.
  ```

### 動作環境

- PyEmuera 3.0.0b2（同梱、未改変、SHA-256 `8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb`）
- Python 3.10 以上（PyEmuera の要件）

ゲームは ERB・ERH・CSV だけで動きます。実行時に Z-machine の解釈系、原作の story ファイル、Python で書かれたゲーム処理は使いません。

### セーブの互換性

セーブ形式を29に変えました。**r28以前の版のセーブは読み込めません。** 以前の版のフォルダーへ上書きせず、新しいフォルダーで始めてください。原作の Quetzal 形式のセーブとの互換性もありません。

### 検証結果

すべて PyEmuera 3.0.0b2 と Linux x86_64、Python 3.13 で実行しました。

| 項目 | 結果 |
| --- | --- |
| 全回帰試験 | 1,596件中1,596件 PASS |
| 旧版・破損セーブの拒否 | PASS |
| 検証ツールの単体試験 | 306件 PASS |
| 原作との比較（`#random 997` で乱数列を揃えた比較） | 801件中799件で文章・状態が一致。残る2件は原作の解釈系が停止する経路（既知の制限を参照） |
| 原作との手ごとの比較（プローブ41本） | 10,324手のうち10,320手が厳密一致、2手が SAVE・RESTORE のファイル名入力の違い、2手が120文字を超える入力 |
| 原作との全経路比較 | 557手すべて一致 |
| 通常の入力だけの完走 | 350点・613手で終幕に到達 |
| 配布物 | ZIP の完全性、検証したゲームとのバイト一致、展開した ZIP での起動・SAVE/RESTORE・RESTART・QUIT・350点経路 |

詳細は [docs/VERIFICATION_ja.md](docs/VERIFICATION_ja.md) を参照してください。

### 既知の制限

- 原作の表示が Z-machine の解釈系に依存する次の経路では、原作と同じ表示になりません。
  - 120文字を超える入力行
  - 物体0を指す IT への操作
  - 目的語なしの SWIM
- 端末で対話的に遊ぶと、ゲームの `>` と PyEmuera の入力欄の `> ` が重なって表示されます。
- Emuera 1.824（Windows）では起動と序盤の操作を確認しています。回帰試験と原作との比較は PyEmuera で行っています。

詳細は [docs/COMPATIBILITY_ja.md](docs/COMPATIBILITY_ja.md) を参照してください。

### 配布物

| ファイル | 内容 |
| --- | --- |
| `ZORKERB-r29.zip` | ゲーム本体（ERB・CSV）、同梱の PyEmuera 3.0.0b2、利用者・開発者向け文書、ライセンス |
| `SHA256SUMS.txt` | 上のファイルの SHA-256 |

## English

ZORKERB r29 is a port of ZORK I: The Great Underground Empire (Release 119 / Serial 880429) to eraBASIC (ERB, ERH and CSV), based on historicalsource/zork1 commit `97b7b3d68c075dd9af7da499c3e9690ada3471fd`.

### Changes

- **Parser:** input is parsed with the original story's dictionary (684 words) and syntax table (267 lines), following the gparser.zil procedure (word scan, CLAUSE, SYNTAX-CHECK, GWIM, ORPHAN). Words that are not in the dictionary, such as `x`, get `I don't know the word`, as in the original.
- **Vocabulary and verbs:** verbs that are in the original dictionary but were missing from earlier revisions (`sit`, `roll`, `slide`, `leave`, `exit`, `lean`, `spin`, `hatch`, `send`, `pump`, `wear`, `play` and others) now follow the original routines.
- **Random numbers:** drawn at the same points and in the same order as the original. The original debugging command `#random` *n* selects the Z-machine's predictable random mode.
- **Display and endings:** these now follow the original text and procedure:
  - room, inventory and container listings;
  - RESTART, RESTORE and QUIT after death or victory;
  - the QUIT and RESTART confirmations;
  - the score display.
- **Input:** these now follow the original:
  - the 120-character input buffer;
  - the Loud Room input loop;
  - OOPS and AGAIN;
  - quotations and orders to characters.
- **Responses:** differences found in comparisons with the original were corrected from the source.
- **Title:** the development banner was replaced by:

  ```text
  ZORK I: The Great Underground Empire
  ZORKERB r29 -- Native eraBASIC port
  Original game: Infocom.
  ```

### Requirements

- PyEmuera 3.0.0b2 (included, unmodified, SHA-256 `8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb`)
- Python 3.10 or later (required by PyEmuera)

The game runs on ERB, ERH and CSV only. It does not use a Z-machine interpreter, the original story file or game logic written in Python at run time.

### Save compatibility

The save format is now version 29. **Saves from r28 and earlier cannot be restored.** Start in a new folder rather than extracting over an earlier revision. The original game's Quetzal saves are not supported.

### Verification

All results were obtained with PyEmuera 3.0.0b2 on Linux x86_64 with Python 3.13.

| Check | Result |
| --- | --- |
| Full regression suite | 1,596 of 1,596 cases pass |
| Rejection of earlier and corrupt saves | Pass |
| Unit tests of the verification tools | 306 pass |
| Comparison with the original, random sequence aligned with `#random 997` | Text and state agree in 799 of 801 cases; the other 2 are paths where the original interpreter stops (see known limitations) |
| Step-by-step comparison with the original (41 probes) | 10,320 of 10,324 steps exactly equal; 2 steps differ only in the save/restore file-name prompt, 2 steps are inputs over 120 characters |
| Full-route comparison with the original | All 557 steps equal |
| Complete game with ordinary input | Ending reached with 350 points in 613 moves |
| Archive | Integrity, byte-identical game files, and new game, SAVE/RESTORE, RESTART, QUIT and the 350-point route from the extracted ZIP |

See [docs/VERIFICATION_en.md](docs/VERIFICATION_en.md) for details.

### Known limitations

- On the following paths the original's output depends on the Z-machine interpreter, so the port does not print the same text:
  - input lines longer than 120 characters;
  - actions on IT when IT refers to object 0;
  - SWIM without an object.
- In an interactive terminal, the game's `>` prompt and PyEmuera's `> ` input line appear together.
- On Emuera 1.824 (Windows), start-up and the first moves have been checked; the regression tests and comparisons with the original were run under PyEmuera.

See [docs/COMPATIBILITY_en.md](docs/COMPATIBILITY_en.md).

### Files

| File | Contents |
| --- | --- |
| `ZORKERB-r29.zip` | The game (ERB and CSV), PyEmuera 3.0.0b2, user and developer documents, licenses |
| `SHA256SUMS.txt` | SHA-256 of the file above |
