# ZORKERB 詳細ガイド

ZORKERB r29 の構成、起動方法、保存先、各資料の役割を説明します。概要は [README.md](README.md) にあります。

## 対象

| 項目 | 内容 |
| --- | --- |
| ゲーム | ZORK I: The Great Underground Empire（Release 119 / Serial 880429） |
| 移植の版 | r29（ゲーム版29、セーブ形式29） |
| 原典 | [historicalsource/zork1](https://github.com/historicalsource/zork1)、コミット `97b7b3d68c075dd9af7da499c3e9690ada3471fd` の ZIL ソース |
| 実行に使うエンジン | 同梱の PyEmuera 3.0.0b2（未改変、SHA-256 `8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb`） |
| 表示と入力 | 英語。原作の文章をそのまま表示します |

## 構成

```text
ZORKERB/
├── README.md / README_en.md / README_ja.md
├── RELEASE_NOTES.md / CHANGELOG.md
├── LICENSE / THIRD_PARTY_NOTICES.md
├── licenses/
│   ├── ZORK1-MIT.txt           Zork I（Microsoft）の MIT License
│   └── PyEmuera/               PyEmuera のライセンスと第三者通知（pyz 内のものと同一）
├── ERB/ / CSV/                 ゲーム本体
├── PyEmuera-3.0.0b2.pyz        実行用エンジン
├── SHA256SUMS.txt              各ファイルの SHA-256
└── docs/                       利用者・開発者向けの文書と Wiki 原稿
```

## 起動

このフォルダーで、PyEmuera にフォルダーを指定して起動します。

```console
python PyEmuera-3.0.0b2.pyz .
```

`python` コマンドがない環境では `python3` を使ってください。

タイトル画面には、次の3つの選択肢があります。

| 入力 | 動作 |
| --- | --- |
| `0` | 新しいゲームを始める |
| `1` | 保存したゲームを読み込む（続けてスロット番号0〜9を入力） |
| `9` | 終了する |

遊び方は[遊び方](docs/PLAYING_ja.md)を参照してください。

## セーブ

- ゲーム中に `save` または `save 番号`（0〜9）で保存し、`restore` または `restore 番号` で読み込みます。
- PyEmuera は、セーブをゲームフォルダー内の `.pyemuera/` に書き込みます。バックアップするときは、このフォルダーも含めてください。
- セーブ形式は29です。以前の版のセーブは読み込みを拒否します。
  - ゲーム中の `restore` では `Failed.` と表示されます。
  - タイトル画面からの読み込みでは `No compatible save in that slot.` と表示されます。

## 端末での表示

ゲームは、入力を待つたびに原作と同じ `>` を表示します。PyEmuera を端末で対話的に使うと、PyEmuera の入力欄にも `> ` が表示されるため、`>` が2回見えます。

```text
There is a small mailbox here.
>
> open mailbox
Opening the small mailbox reveals a leaflet.
```

1行目の `>` はゲームの表示で、2行目はプレイヤーの入力です。ゲームの動作には影響しません。

## 原作との違い

ゲームの処理は原作の ZIL ソースに従っています。検証の範囲と、原作と同じ表示にならない場合は、次の文書にまとめています。

- [互換性と既知の制限](docs/COMPATIBILITY_ja.md)
- [検証](docs/VERIFICATION_ja.md)

## 開発者向け

- [開発者向けガイド](docs/DEVELOPER_GUIDE_ja.md)
- [アーキテクチャ](docs/ARCHITECTURE_ja.md)
- [ZIL と ERB の対応](docs/SOURCE_MAPPING_ja.md)

## ライセンス

[LICENSE](LICENSE) と [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) を参照してください。
