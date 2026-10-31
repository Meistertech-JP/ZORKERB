日本語 | [English](Architecture-English)

# アーキテクチャ

ZORKERB r29 の ERB 実装の構成を説明します。ファイル名は `ERB/` 内のものです。

## 全体の構成

ゲームは Emuera のシステム関数（`@SYSTEM_TITLE`、`@EVENTFIRST`、`@SHOW_SHOP`、`@EVENTLOAD`）を入口にして動きます。原作の MAIN-LOOP に当たる1手の処理は、`@SHOW_SHOP` から呼び出す `Z_READ_TURN` が受け持ちます。

```text
@SYSTEM_TITLE（02_Flow）    タイトル、新規・復帰・終了、RESTART 後の再初期化
  └ @SHOW_SHOP（02_Flow）   1手ごとの入力と、SAVE・RESTORE・RESTART・QUIT の実行
      └ Z_READ_TURN（42_CommandStream）
          ├ 入力の読み込み、文の区切り、引用符、人物への指示
          ├ 構文解析（37〜43、49）
          ├ Z_PERFORM（50_Actions）     原作 PERFORM の順で各 ACTION を呼ぶ
          └ 時計（90_Clock）           手番の終わりの割り込み処理
@EVENTLOAD（02_Flow）        セーブ形式と保存状態の検査
```

## 状態とセーブ

- ゲームの状態は `01_State.ERH` で宣言した変数に入っています。部屋や物体の位置、フラグ、時計、乱数の状態、構文解析の途中状態などです。
- このうち SAVEDATA を付けた変数だけがセーブに含まれます。セーブ・ロードには Emuera の `SAVEDATA`・`CHKDATA`・`LOADDATA` を使います。
- `@EVENTLOAD` は、セーブ形式（`Z_SCHEMA`）と保存されている状態の値を検査します。異常があれば読み込みを中止し、タイトルへ戻します。

## 世界の定義

部屋と物体（110部屋、141物体）は、開発用の定義データから生成した次の2つのファイルにあります。

- `00_Ids.ERH`（部屋・物体の番号）
- `10_World.ERB`（初期配置と属性）

物体の親子関係は、Z-machine の INSERT_OBJ・REMOVE_OBJ と同じ順序規則で `21_ObjectTree.ERB` が扱います。

## 構文解析

| ファイル | 役割 |
| --- | --- |
| `42_CommandStream.ERB` | 入力行の読み込み（120文字）、文の区切り（ピリオド、THEN）、引用符、人物への指示、AGAIN、OOPS |
| `37_SourceParser.ERB` | gparser.zil の語の走査、CLAUSE、SYNTAX-CHECK |
| `38_ParserTables.ERB` | 原作 story から取り出した辞書（684語）と構文表（267行）。生成ファイル |
| `39_Dictionary.ERB` | V3 の辞書照合（先頭6文字） |
| `40_Parser.ERB`、`41_Grammar.ERB` | 目的語の解決と、動詞・前置詞の対応 |
| `43_SyntaxChecks.ERB` | TAKE-CHECK、ITAKE-CHECK など構文の引数フラグの検査 |
| `49_Inference.ERB` | GWIM（目的語の推定）と候補の絞り込み |
| `44_Speech.ERB` | SAY、TELL、人物への指示 |
| `58_PseudoObjects.ERB` | GLOBAL-CHECK と疑似物体 |

## 動作の実行

`50_Actions.ERB` の `Z_PERFORM` が、原作 PERFORM と同じ順序で処理を呼び出します。

1. 対象が見えない場合の処理
2. 行為者（WINNER）
3. 部屋の M-BEG
4. 前処理（PRE-）
5. 間接目的語の ACTION
6. 直接目的語の ACTION
7. 動詞の既定処理

| ファイル | 役割 |
| --- | --- |
| `46_ObjectOverrides.ERB`、`53_SceneryActions.ERB`、`54_GlobalActions.ERB` | 物体ごとの ACTION |
| `45_MiscActions.ERB`、`48_SimpleVerbs.ERB`、`52_SelfActions.ERB`、`55_GenericActions.ERB`、`57_AdditionalActions.ERB`、`59_SourceVerbs.ERB` | 動詞の既定処理（gverbs.zil） |
| `47_Water.ERB` | 水と容器 |
| `56_Leap.ERB` | 跳躍と落下 |
| `60_Puzzles.ERB`、`72_Maze.ERB`、`80_Dam.ERB`〜`85_EggEnd.ERB`、`91_Forest.ERB` | 地域ごとの仕掛け（家、迷路、ダム、神殿、川、鉱山、卵と終幕、森） |
| `70_Combat.ERB`〜`74_ThiefText.ERB`、`86_Thief.ERB` | 戦闘と盗賊 |
| `87_Death.ERB` | 死亡、物の散乱、死後の行動（DEAD-FUNCTION） |
| `90_Clock.ERB` | gclock.zil の割り込み表と手番の処理 |
| `30_Display.ERB`、`31_OracleResponses.ERB` | 部屋と物の描写、所持品の一覧、共通の応答 |

## 乱数

`03_Random.ERB` は、ZIL の `RANDOM` を Z-machine と同じ形で実装しています。

- **通常時：** エンジンの乱数から引きます。
- **`#random N`（1〜999）の後：** Z-machine 規格の予測可能な順次モードになります。

原作と同じ箇所・同じ順序で引くため、順次モードでは原作と同じ乱数列になります。

## 生成と実行の分離

| 場面 | 使うもの |
| --- | --- |
| 生成 | `00_Ids.ERH`、`10_World.ERB`、`38_ParserTables.ERB` は、開発環境の Python ツールが定義データから作った生成ファイルです。それ以外の ERB・ERH は手で書いたソースです。 |
| 実行 | ERB・ERH・CSV だけを使います。Python のコード、原作 story、Z-machine の解釈系は使いません。 |
