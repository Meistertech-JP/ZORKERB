日本語 | [English](Developer-Guide-English)

# 開発者向けガイド

配布物の構成と、ERB を読む・変更する・動作を確かめるための情報です。

## 構成

```text
PyEmuera-3.0.0.pyz        実行用エンジン（未改変、収録作品用）
ZORKERB-I/ERB/、CSV/      ZORKERB I のゲーム本体
ZORKERB-I/docs/           ZORKERB I の実装資料（アーキテクチャ、原典との対応）
ZORKERB-II/ERB/、CSV/     ZORKERB II のゲーム本体
docs/                     収録作品に共通の文書
licenses/                 ライセンスと権利表示
```

ERB・ERH は UTF-8（BOM 付き）です。

## 生成ファイルと手書きのファイル

| 作品 | 生成ファイル | それ以外 |
| --- | --- | --- |
| ZORKERB I | `00_Ids.ERH`、`10_World.ERB`、`38_ParserTables.ERB`（部屋・物体の定義と、原作 story から取り出した辞書・構文表から生成） | 手で書いたソースです。処理の近くに、対応する ZIL の ROUTINE 名をコメントで書いています |
| ZORKERB II | `00_Ids.ERH`、`10_World.ERB`、`79_Gen_Ints.ERB`・`.ERH`、`80_Gen_GVerbs.ERB`〜`83_Gen_2Actions.ERB`（原典 ZIL と原作 story から生成。ファイル先頭に生成元を記録） | 手で書いたソースです（パーサー、表示、保存の検査、時計など） |

生成ファイルを手で直すと、ほかのファイルが前提にしている番号や表との整合が崩れることがあります。生成に使ったツールは開発用の非公開リポジトリにあります。

## 実行と確認

以下は `PyEmuera-3.0.0.pyz` があるフォルダーで実行します。

ゲームを起動します。

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
```

PyEmuera の静的な検査（ゲームは実行しない）を行います。

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I --check
```

入力をファイルから与えて実行します。1行目にタイトル画面の選択（`0`）を書き、続けてコマンドを1行ずつ書きます。

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I --inputs replay.txt --no-wait
```

`--inputs` で実行した場合、PyEmuera の入力欄は表示されず、ゲームの出力と入力の写しだけが出ます。乱数を固定するには `--seed 数` を使います。原作と同じ乱数列にするには、ゲームの最初の入力として `#random 997` のような命令を入れます。

PyEmuera のほかの機能は `python3 PyEmuera-3.0.0.pyz --help` と PyEmuera の文書を参照してください。

## 変更するときの注意

- **原作の処理を変えないこと：** 応答の文や処理の順序は原典 ZIL に合わせています。原典の場所は[参照資料](https://github.com/Meistertech-JP/ZORKERB/blob/main/docs/SOURCES.md)にあります。
- 乱数は `03_Random.ERB` の `Z_RANDOM` を通して引きます。場所と順序を維持してください。
- 乱数は `03_Random.ERB` の `Z2_RANDOM` を通して引きます。場所と順序を維持してください。
- **セーブの互換性を守ること：** SAVEDATA の変数（`01_State.ERH`）を変えると、既存のセーブと互換性がなくなります。`@EVENTLOAD` の検査も見直してください。

実装の構造：[アーキテクチャ](Architecture)、[ZIL 原典と ERB 実装の対応](Original-Source)。
実装の説明：[ZORKERB II の README](ZORKERB-II)。

## 検証

検証は、開発用の非公開リポジトリにある試験と比較のツールで行いました。配布物には、それらのツール、原作の story ファイル、比較用の解釈系を含めていません。方法と結果は[検証](Testing-and-Verification)にあります。
