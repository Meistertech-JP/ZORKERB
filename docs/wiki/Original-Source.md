日本語 | [English](Original-Source-English)

# ZIL 原典と ERB 実装の対応

## 原典

ZORKERB r29 の原典は、historicalsource/zork1 のコミット `97b7b3d68c075dd9af7da499c3e9690ada3471fd` の ZIL ソースです。

原典は https://github.com/historicalsource/zork1/tree/97b7b3d68c075dd9af7da499c3e9690ada3471fd で読めます。

比較に使った原作 story は、同じコミットの `COMPILED/zork1.z3`（Release 119 / Serial 880429、SHA-256 `37084966477dff679282de42974b2077156b1bd68fad92a65d4ea94d8eb64d79`）です。

## ファイルの対応

| ZIL ファイル | 内容 | 主な ERB ファイル |
| --- | --- | --- |
| `gparser.zil` | 構文解析（PARSER、CLAUSE、SYNTAX-CHECK、GWIM、ORPHAN、GLOBAL-CHECK） | `37_SourceParser`、`39_Dictionary`、`40_Parser`、`42_CommandStream`、`43_SyntaxChecks`、`49_Inference`、`58_PseudoObjects` |
| `gsyntax.zil` | 構文表と動詞の定義 | `38_ParserTables`（story から抽出した表）、`41_Grammar` |
| `gmain.zil` | MAIN-LOOP、PERFORM | `42_CommandStream`、`50_Actions` |
| `gverbs.zil` | 動詞の既定処理（V-、PRE-）、SAVE・RESTORE・RESTART・QUIT・FINISH | `48_SimpleVerbs`、`52_SelfActions`、`55_GenericActions`、`57_AdditionalActions`、`59_SourceVerbs`、`02_Flow`、`87_Death` |
| `gglobals.zil` | 共通の物体と疑似物体 | `52_SelfActions`、`54_GlobalActions`、`58_PseudoObjects` |
| `gclock.zil` | 割り込みと手番の処理 | `90_Clock` |
| `gmacros.zil` | `RANDOM`、`PROB` など | `03_Random` |
| `1dungeon.zil` | 部屋と物体の定義 | `00_Ids.ERH`、`10_World.ERB`（生成ファイル） |
| `1actions.zil` | 部屋・物体・人物ごとの処理、戦闘、盗賊 | `46_ObjectOverrides`、`47_Water`、`53_SceneryActions`、`60_Puzzles`、`70`〜`74`、`80`〜`87`、`91_Forest` |

各 ERB ファイルの冒頭と処理の近くには、対応する ZIL の ROUTINE 名をコメントで書いています。

## ROUTINE ごとの対応

開発環境では、原典の全 ROUTINE について、移植での対応箇所、原典の文字列が移植にあるか、その文字列が原作との比較で実際に出力されたか、原典内で参照されているかを一覧にしています。

r29 の集計は次のとおりです。

| 判定 | 件数 | 意味 |
| --- | ---: | --- |
| VERIFIED | 175 | ROUTINE の文字列が出力される場面を原作と比べ、移植の応答が一致したことを記録済み |
| IMPLEMENTED | 265 | 文字列は移植にあるが、その文字列が出る場面を原作との比較ではまだ観測していない（文字列のない ROUTINE を含む） |
| UNREFERENCED | 1 | 原典のどこからも使われていない（`UNTIE-FROM`。この ROUTINE を指す構文行がない） |
| GAP | 0 | 文字列が移植にも記録された理由にもないもの |

GAP が0であることは、原典の文字列がすべて移植にあるか、到達しない理由が記録されているという意味です。すべての分岐の動作を確かめたという意味ではありません。動作の検証の範囲は[検証](Testing-and-Verification)にあります。

## 到達しない分岐

原典には、Zork I では使われない分岐があります。

- Zork II・III 専用の分岐（`ZORK-NUMBER` で切り替わるもの）
- コメントアウトされた節
- DEBUG 用の出力
- Zork I の物体が持たないフラグ（WEARBIT など）

これらは移植していません。
