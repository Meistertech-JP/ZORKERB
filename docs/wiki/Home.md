日本語 | [English](Home-English)

# ZORKERB Wiki

ZORKERB は、Infocom の『ZORK I: The Great Underground Empire』（Release 119 / Serial 880429）を eraBASIC（ERB・ERH・CSV）で書き直した移植版です。

- 対象の版は **r29** です。
- 原典は、Microsoft が MIT License で公開している [historicalsource/zork1](https://github.com/historicalsource/zork1) のコミット `97b7b3d68c075dd9af7da499c3e9690ada3471fd` です。
- ゲームの処理はすべて ERB で書かれています。同梱の PyEmuera 3.0.0b2 で動かし、実行時に Z-machine の解釈系や原作の story ファイルは使いません。

ZORKERB は Infocom、Microsoft、Emuera の作者による公式版ではなく、これらの承認を受けたものでもありません。

## 遊ぶ

- [はじめに](Getting-Started)：必要なもの、起動、タイトル画面。
- [遊び方](Playing)：コマンドの形とよく使うコマンド。
- [保存と復帰](Saving-and-Restoring)：スロット、旧版セーブとの互換性。
- [互換性と既知の制限](Compatibility-and-Limitations)：検証した環境と、原作と表示が異なる場合。

## 開発する

- [アーキテクチャ](Architecture)：ERB 実装の構成。
- [原典と ERB の対応](Original-Source)：ZIL ファイルと ERB ファイル、ROUTINE ごとの対応。
- [開発者向けガイド](Developer-Guide)：ファイル構成、実行と確認、変更するときの注意。
- [検証](Testing-and-Verification)：検証の方法と r29 の結果。

## プロジェクト

- [ライセンスと権利表示](License-and-Attribution)
- [English Home](Home-English)
