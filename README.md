# ZORKERB

Infocom のテキストアドベンチャー（ZORKERB I・ZORKERB II）を、Emuera 互換の eraBASIC（ERB・ERH・CSV）に移植したものです。English: [README_en.md](README_en.md)

| 作品 | 原作 | 起動（Windows） | 説明 |
| --- | --- | --- | --- |
| ZORKERB I | ZORK I: The Great Underground Empire（Release 119 / Serial 880429） | `ZORKERB-I.bat` | [ZORKERB-I/README_ja.md](ZORKERB-I/README_ja.md) |
| ZORKERB II | ZORK II: The Wizard of Frobozz（Release 63 / Serial 860811） | `ZORKERB-II.bat` | [ZORKERB-II/README_ja.md](ZORKERB-II/README_ja.md) |

ゲームの処理はすべて ERB で書かれています。原作の ZIL ソース（Microsoft が MIT License で公開）をもとに書き直し、原作の文章（英語）をそのまま使っています。実行時に Z-machine の解釈系や原作の story ファイルは使いません。

ZORKERB は非公式の移植です。Infocom、Microsoft、Emuera の作者、PyEmuera の開発者による公式版ではなく、これらの承認を受けたものでもありません。

## 起動

Python 3.10 以上が必要です（同梱していません）。

- **Windows：** `ZORKERB-I.bat` または `ZORKERB-II.bat` をダブルクリックします。
- **そのほかの環境：** このフォルダーで次のように実行します。

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
python3 PyEmuera-3.0.0.pyz ZORKERB-II
```

タイトル画面で `0` を入力すると新しいゲームが始まります。収録作品は、このフォルダーの `PyEmuera-3.0.0.pyz`（未改変の PyEmuera 3.0.0、SHA-256 `8a7b3697b97155c4dc994c8349c6756bb0401000d3bbccd8e85ff046e3774b35`）で動きます。

## 構成

```text
PyEmuera-3.0.0.pyz        収録作品用の実行エンジン
ZORKERB-I.bat             ZORKERB I を起動（Windows）
ZORKERB-II.bat            ZORKERB II を起動（Windows）
ZORKERB-I/                ZORKERB I のゲーム（ERB/、CSV/）、README、作品の資料
ZORKERB-II/               ZORKERB II のゲーム（ERB/、CSV/）、README
docs/                     収録作品に共通の文書
licenses/                 ライセンスと権利表示
SHA256SUMS.txt            各ファイルの SHA-256
```

## 文書

| 文書 | 内容 |
| --- | --- |
| [はじめに](docs/GETTING_STARTED_ja.md) | 必要なもの、起動、タイトル画面 |
| [遊び方](docs/PLAYING_ja.md) | コマンドの形、よく使うコマンド、保存と復帰 |
| [互換性と既知の制限](docs/COMPATIBILITY_ja.md) | 実行環境ごとの確認状況と、原作と同じにならない場合 |
| [検証](docs/VERIFICATION_ja.md) | 検証の方法と結果 |
| [開発者向けガイド](docs/DEVELOPER_GUIDE_ja.md) | ファイルの構成、実行と確認、変更するときの注意 |
| [参照資料](docs/SOURCES.md) | 原典と検証に使った資料（英語） |

## 検証

固定した原作 story を Frotz で動かし、同じ入力を与えた移植版と比べました。結果と確認範囲は[検証](docs/VERIFICATION_ja.md)を参照してください。

## 謝辞

『ZORK I』：Marc Blank、Dave Lebling、Bruce Daniels、Tim Anderson。Infocom 発売。
『ZORK II』：Dave Lebling、Marc Blank。Infocom 発売。

原典を MIT License で公開した Microsoft と、保存・公開している historicalsource に感謝します。

## ライセンスと権利表示

- ZORKERB の ERB 移植：MIT License、Copyright (c) 2026 Meistertech-JP（[LICENSE](LICENSE)）
- Zork I: MIT License, Copyright (c) 2025 Microsoft ([licenses/ZORK1-MIT.txt](licenses/ZORK1-MIT.txt))
- Zork II: MIT License, Copyright (c) 2025 Microsoft ([licenses/ZORK2-MIT.txt](licenses/ZORK2-MIT.txt))
- PyEmuera 3.0.0：MIT License。Emuera 由来の部分などは、それぞれの条件に従います（[licenses/PyEmuera/](licenses/PyEmuera/LICENSE)）

MIT License は著作権についての許諾で、商標の使用を許諾するものではありません。「Zork」「Infocom」などの名称は、それぞれの権利者の商標である場合があります。ZORKERB は、これらの名称を作品を説明する目的でのみ使っています。詳細は [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) を参照してください。
