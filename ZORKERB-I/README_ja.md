# ZORKERB I

Infocom のテキストアドベンチャー『ZORK I: The Great Underground Empire』を eraBASIC（ERB・ERH・CSV）に移植したものです。収録作品に共通の説明は、リポジトリ直下の [README](../README.md) と [docs/](../docs/GETTING_STARTED_ja.md) にあります。English: [README_en.md](README_en.md)

## 対象

| 項目 | 内容 |
| --- | --- |
| 原作 | ZORK I: The Great Underground Empire（Release 119 / Serial 880429） |
| 原典 | [historicalsource/zork1](https://github.com/historicalsource/zork1)、コミット `97b7b3d68c075dd9af7da499c3e9690ada3471fd` の ZIL ソース |
| 版 | r30（タイトル画面に `ZORKERB r30` と表示）。セーブ形式29 |

## 起動

Windows ではリポジトリ直下の `ZORKERB-I.bat` をダブルクリックします。そのほかの環境では、直下（`PyEmuera-3.0.0.pyz` がある場所）で次のように実行します。

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
```

タイトル画面で `0` を入力すると新しいゲームが始まります。最初の手順は[はじめに](../docs/GETTING_STARTED_ja.md)、コマンドと保存・復帰は[遊び方](../docs/PLAYING_ja.md)にあります。

## この作品について

- セーブはこのフォルダーの `.pyemuera/saves/` に作られます。r29 のセーブは読み込めます。r28 以前の版のセーブは読み込みを拒否します。
- ゲーム開始直後に、郵便受けの中のリーフレット（`read leaflet`）で原作の遊び方の説明を読めます。
- 原作の表示が解釈系に依存する一部の経路（120文字を超える入力行など）は、原作と同じ表示になりません。一覧は[互換性と既知の制限](../docs/COMPATIBILITY_ja.md)にあります。
- 検証の結果（回帰試験1,596件、原作との比較、350点の完走など）は[検証](../docs/VERIFICATION_ja.md)にあります。

## 資料

| 資料 | 内容 |
| --- | --- |
| [アーキテクチャ](docs/ARCHITECTURE_ja.md) | ERB 実装の構造 |
| [ZIL 原典と ERB 実装の対応](docs/SOURCE_MAPPING_ja.md) | 原典のファイル・ROUTINE と ERB の対応 |
| [リリースノート](RELEASE_NOTES.md) | r30 と r29 の変更点 |
| [変更履歴](CHANGELOG.md) | 版ごとの変更 |

## 謝辞

『ZORK I』は、Marc Blank、Dave Lebling、Bruce Daniels、Tim Anderson が制作し、Infocom が発売した作品です。Zork I のソースを MIT License で公開した Microsoft と、原典を保存・公開している historicalsource/zork1 に感謝します。

## ライセンス

ERB 移植は MIT License（Copyright (c) 2026 Meistertech-JP）です。原作 Zork I のソースと文章は Microsoft の MIT License（Copyright (c) 2025 Microsoft）に従います。詳細は直下の [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md) にあります。
