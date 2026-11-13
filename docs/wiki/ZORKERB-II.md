日本語 | [English](ZORKERB-II-English)

# ZORKERB II

Infocom のテキストアドベンチャー『ZORK II: The Wizard of Frobozz』を eraBASIC（ERB・ERH・CSV）に移植したものです。収録作品に共通の説明は、リポジトリ直下の [README](Home) と [docs/](Getting-Started) にあります。

## 対象

| 項目 | 内容 |
| --- | --- |
| 原作 | ZORK II: The Wizard of Frobozz（Release 63 / Serial 860811） |
| 原典 | [historicalsource/zork2](https://github.com/historicalsource/zork2)、コミット `3da9661098809788a99cef00f00c865c6c204f96` の ZIL ソース |
| 版 | 最初の公開版 |

原作のソースコード（ZIL）を eraBASIC に移したものです。ゲームの規則、文章、パーサー、時計のイベント、乱数の使い方は原作のソースに合わせています。原作の439ルーチンのうち370は ZIL から生成し、ほかは手で書いています。Z-machine のエミュレーターではなく、実行時に原作の story ファイルや Z-machine の解釈系は使いません。

## 起動

Windows ではリポジトリ直下の `ZORKERB-II.bat` をダブルクリックします。そのほかの環境では、直下（`PyEmuera-3.0.0.pyz` がある場所）で次のように実行します。

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-II
```

タイトル画面で `0` を入力すると新しいゲームが始まります。最初の手順は[はじめに](Getting-Started)、コマンドと保存・復帰は[遊び方](Playing)にあります。

## この作品について

- セーブはこのフォルダーの `.pyemuera/saves/` に作られます。本家 Emuera で遊ぶ場合のセーブは Emuera 独自の形式で、PyEmuera のセーブとは互換性がありません。
- **呪文 Fantasize の幻：** 呪文がかかっている間に、持っていない開いた入れ物の中を見ると、原作は `Fatal error: Store out of dynamic memory` で止まります。移植版も同じ場所で同じメッセージを出して終わります。原作そのものの挙動です。試すときは先に保存してください。
- 本家 Emuera で途中で切れたセーブファイルを読み込むと、エンジンのエラーで止まります。セーブファイルは編集しないでください。
- そのほかの制限と、実行環境ごとの確認状況は[互換性と既知の制限](Compatibility-and-Limitations)にあります。

## 確認したこと

固定した原作 story を Frotz で動かし、同じ入力を与えた移植版と比べました。

- 240件、74,130の比較ステップで表示が一致。乱数の呼び出し47,650回と、内部状態74,114時点も一致。
- 400点の完走、10スロットの保存と別のプロセスでの復元。
- 独立した監査で、原作との直接の比較（10経路・1,718応答）と、原典 ZIL からの再構築（ゲームのファイルがバイト単位で一致）を確認。
- 本家 Emuera1824+v24（Windows）で、保存・復元を含む自動再生11件が、行の折り返しなど表示の違いを除いて期待どおり。

これは有限の試験の結果で、原作との完全な互換を証明したものではありません。通っていない分岐も残っています。詳細は[検証](Testing-and-Verification)にあります。

## 謝辞

『ZORK II』は、Dave Lebling と Marc Blank が制作し、Infocom が発売した作品です。Zork II のソースを MIT License で公開した Microsoft と、原典を保存・公開している historicalsource/zork2 に感謝します。

## ライセンス

ERB 移植は MIT License（Copyright (c) 2026 Meistertech-JP）です。原作 Zork II のソースと文章、ZIL から生成した ERB は Microsoft の MIT License（Copyright (c) 2025 Microsoft）に従います。詳細は直下の [THIRD_PARTY_NOTICES.md](License-and-Attribution) にあります。
