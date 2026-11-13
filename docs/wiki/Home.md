日本語 | [English](Home-English)

# ZORKERB Wiki

ZORKERB は、Infocom のテキストアドベンチャーを eraBASIC（ERB・ERH・CSV）で書き直した移植版です。このリポジトリには2作品があります。

| 作品 | 原作 | 版 | 原典 |
| --- | --- | --- | --- |
| ZORKERB I | ZORK I: The Great Underground Empire（Release 119 / Serial 880429） | r30 | [historicalsource/zork1](https://github.com/historicalsource/zork1) `97b7b3d6…` |
| ZORKERB II | ZORK II: The Wizard of Frobozz（Release 63 / Serial 860811） | 最初の公開版（リポジトリの版 r30） | [historicalsource/zork2](https://github.com/historicalsource/zork2) `3da96610…` |

- ゲームの処理はすべて ERB で書かれています。2作品で共通の PyEmuera 3.0.0（リポジトリ直下の `PyEmuera-3.0.0.pyz`）で動かし、実行時に Z-machine の解釈系や原作の story ファイルは使いません。
- Windows では `ZORKERB-I.bat` または `ZORKERB-II.bat` をダブルクリックすると起動します。

ZORKERB は Infocom、Microsoft、Emuera の作者、PyEmuera の開発者による公式版ではなく、これらの承認を受けたものでもありません。

## 遊ぶ

- [はじめに](Getting-Started)：必要なもの、起動、タイトル画面（2作品共通）。
- [ZORKERB II](ZORKERB-II)：ZORKERB II の概要、確認したこと、既知の制限。
- [遊び方](Playing)、[保存と復帰](Saving-and-Restoring)：2作品共通。
- [互換性と既知の制限](Compatibility-and-Limitations)：実行環境ごとの確認状況と、原作と同じにならない場合（2作品）。

## 開発する

- [開発者向けガイド](Developer-Guide)：ファイル構成、実行と確認、変更するときの注意（2作品共通）。
- [検証](Testing-and-Verification)：検証の方法と2作品の結果。
- [アーキテクチャ](Architecture)：ZORKERB I の ERB 実装の構成。
- [原典と ERB の対応](Original-Source)：ZORKERB I の ZIL ファイルと ERB ファイル、ROUTINE ごとの対応。

## プロジェクト

- [ライセンスと権利表示](License-and-Attribution)
- [English Home](Home-English)
