# ZORKERB

**r29** · [English](README_en.md) · [詳細ガイド](README_ja.md)

ZORKERB は、Infocom のテキストアドベンチャー『ZORK I: The Great Underground Empire』（Release 119 / Serial 880429）を、Emuera 互換の eraBASIC（ERB・ERH・CSV）で書き直した移植版です。

## 原作との関係

ZORKERB は、Microsoft が MIT License で公開している Zork I の ZIL ソース（[historicalsource/zork1](https://github.com/historicalsource/zork1)、コミット `97b7b3d68c075dd9af7da499c3e9690ada3471fd`）をもとにしています。部屋・物体・構文解析・戦闘・時計・得点などの処理を ERB で書き直し、原作の文章（英語）はそのまま使っています。

ZORKERB は Infocom、Microsoft、Emuera の作者による公式版ではなく、これらの承認を受けたものでもありません。

## eraBASIC によるネイティブ移植

ゲームの処理はすべて ERB で書かれています。実行時に Z-machine の解釈系、原作の story ファイル、Python で書かれた別のゲーム実装は使いません。

ゲームは、同梱の Emuera 互換エンジン [PyEmuera](https://github.com/Meistertech-JP/PyEmuera) 3.0.0b2 で動かします。

## 動作環境と起動

- Python 3.10 以上が必要です（PyEmuera の要件）。
- 同梱の `PyEmuera-3.0.0b2.pyz` は、未改変の PyEmuera 3.0.0b2 です（SHA-256 `8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb`）。

このフォルダー（`ERB/` と `CSV/` がある場所）で、次のように実行します。

```console
python PyEmuera-3.0.0b2.pyz .
```

タイトル画面で `0` を入力すると新しいゲームが始まります。詳しくは[はじめに](docs/GETTING_STARTED_ja.md)を参照してください。

## 遊び方・保存と復帰

入力は英語のコマンドです（`look`、`open mailbox`、`take leaflet`、`north`、`inventory`、`score` など）。

| 操作 | コマンド |
| --- | --- |
| 保存 | `save 3` のように、スロット番号0〜9を付けて保存します。番号を省くとスロット0です。 |
| 復帰 | ゲーム中に `restore 3`、またはタイトル画面の `[1] Restore` で復帰します。 |
| 最初から | `restart` |
| 終了 | `quit` |

セーブ形式は29です。それより前の版のセーブ、原作の Quetzal 形式のセーブは読み込めません。

詳しくは[遊び方](docs/PLAYING_ja.md)を参照してください。

## 互換性と既知の制限

r29 では、PyEmuera 3.0.0b2 上で次の検証を行いました。

- 全回帰試験 1,596件
- 原作 story と同じ乱数列での比較
- 通常の入力だけで350点・613手で終幕に到達する経路の完走

原作の表示が解釈系に依存する一部の経路（120文字を超える入力行など）は、原作と同じ表示になりません。Emuera 1.824（Windows）では起動と序盤の操作を確認しています。回帰試験と原作との比較は PyEmuera で行っています。

詳しくは次の文書を参照してください。

- [互換性と既知の制限](docs/COMPATIBILITY_ja.md)
- [検証](docs/VERIFICATION_ja.md)

## 資料

| 資料 | 内容 |
| --- | --- |
| [開発者向けガイド](docs/DEVELOPER_GUIDE_ja.md) | ファイル構成、実行と確認の方法、変更するときの注意 |
| [アーキテクチャ](docs/ARCHITECTURE_ja.md) | ERB 実装の構造 |
| [ZIL と ERB の対応](docs/SOURCE_MAPPING_ja.md) | 原典と移植の対応 |
| [参照資料](docs/SOURCES.md) | 原典と検証に使った資料 |
| [リリースノート](RELEASE_NOTES.md) | r29 の変更点 |
| [変更履歴](CHANGELOG.md) | 版ごとの変更 |
| [Wiki 原稿](docs/wiki/Home.md) | Wiki 用の原稿 |

## ライセンスと権利表示

ZORKERB の ERB 移植コードは MIT License です（Copyright (c) 2026 Meistertech-JP、[LICENSE](LICENSE)）。

原作 Zork I のソースと文章は、Microsoft の MIT License に従います（Copyright (c) 2025 Microsoft、[licenses/ZORK1-MIT.txt](licenses/ZORK1-MIT.txt)）。

同梱の PyEmuera は MIT License です。Emuera 由来の部分などは、それぞれの条件に従います（[licenses/PyEmuera/](licenses/PyEmuera/LICENSE)）。

詳細は [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) を参照してください。
