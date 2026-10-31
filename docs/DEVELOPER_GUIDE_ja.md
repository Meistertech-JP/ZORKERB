# 開発者向けガイド

この配布物の構成と、ERB を読む・変更する・動作を確かめるための情報です。ERB 実装の構造は[アーキテクチャ](ARCHITECTURE_ja.md)、原典との対応は [ZIL 原典と ERB 実装の対応](SOURCE_MAPPING_ja.md) を参照してください。

## 構成

```text
ERB/                      ゲーム本体（ERB・ERH）
CSV/GameBase.csv          ゲームのタイトル、コード、バージョン
PyEmuera-3.0.0b2.pyz      実行用エンジン（未改変）
docs/                     利用者・開発者向けの文書と Wiki 原稿
licenses/                 Zork I と PyEmuera のライセンス・権利表示
```

## ERB ファイルの種類

| 種類 | ファイル | 扱い |
| --- | --- | --- |
| 生成ファイル | `00_Ids.ERH`、`10_World.ERB`、`38_ParserTables.ERB` | 部屋・物体の定義と、原作 story から取り出した辞書・構文表から生成したものです。手で直すと、ほかのファイルが前提にしている番号や表との整合が崩れることがあります。 |
| 状態の宣言 | `01_State.ERH` | SAVEDATA の変数がセーブ形式29の内容です。変数を加えたり変えたりすると、既存のセーブと互換性がなくなります。 |
| それ以外 | `02_Flow.ERB` 〜 `91_Forest.ERB` | 手で書いたソースです。処理の近くに、対応する ZIL の ROUTINE 名をコメントで書いています。 |

ERB・ERH は UTF-8（BOM 付き）です。

## 実行と確認

ゲームを起動します。

```console
python PyEmuera-3.0.0b2.pyz .
```

PyEmuera の静的な検査（ゲームは実行しない）を行います。

```console
python PyEmuera-3.0.0b2.pyz . --check
```

入力をファイルから与えて実行します。1行目にタイトル画面の選択（`0`）を書き、続けてコマンドを1行ずつ書きます。

```console
python PyEmuera-3.0.0b2.pyz . --inputs replay.txt --no-wait
```

`--inputs` で実行した場合、PyEmuera の入力欄は表示されず、ゲームの出力と入力の写しだけが出ます。乱数を固定するには `--seed 数` を使います。原作と同じ乱数列にするには、ゲームの最初の入力として `#random 997` のような命令を入れます。

PyEmuera のほかの機能は `python PyEmuera-3.0.0b2.pyz --help` と PyEmuera の文書を参照してください。

## 変更するときの注意

- 原作の処理を変えないこと：応答の文や処理の順序は、原典 ZIL に合わせています。原典は https://github.com/historicalsource/zork1/tree/97b7b3d68c075dd9af7da499c3e9690ada3471fd で読めます。
- 乱数を引く場所と順序を変えないこと：乱数は `03_Random.ERB` の `Z_RANDOM` だけで引いています。引く場所や順序を変えると、原作と同じ乱数列にならなくなります。
- セーブの互換性を守ること：SAVEDATA の変数を変えたときは、`@EVENTLOAD` の検査と `Z_SCHEMA` の値を見直してください。

## 検証

r29 の検証は、開発用の非公開リポジトリにある試験と比較のツールで行いました。この配布物には、それらのツール、原作の story ファイル、比較用の解釈系を含めていません。検証の方法と確認済みの結果は[検証](VERIFICATION_ja.md)にあります。
