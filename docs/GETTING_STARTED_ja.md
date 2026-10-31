# はじめに

ZORKERB r29 を入手して起動し、最初の数手を遊ぶまでの手順です。

## 必要なもの

- Python 3.10 以上
- ZORKERB 一式（`ERB/`、`CSV/`、同梱の `PyEmuera-3.0.0b2.pyz`）

同梱の PyEmuera は、未改変の PyEmuera 3.0.0b2 です。

```text
8473b250080ba678e05b4f484fcc6790f96614c2e9a7aaab077ab379e05f4bcb  PyEmuera-3.0.0b2.pyz
```

## 1. ゲームを用意する

配布 ZIP を新しいフォルダーへ展開するか、リポジトリを取得します。以前の版を展開したフォルダーへは上書きしないでください。以前の版のセーブは r29 では読み込めません。

## 2. 起動する

`ERB/` と `CSV/` があるフォルダーで、次のように実行します。

```console
python PyEmuera-3.0.0b2.pyz .
```

`python` がない環境では `python3` を使ってください。

## 3. タイトル画面

```text
ZORK I: The Great Underground Empire
ZORKERB r29 -- Native eraBASIC port
Original game: Infocom.
[0] New game  [1] Restore  [9] Quit
```

`0` で新しいゲーム、`1` で保存したゲームの読み込み、`9` で終了です。

## 4. 最初の数手

```text
West of House
You are standing in an open field west of a white house, with a boarded
front door.
There is a small mailbox here.
>open mailbox
Opening the small mailbox reveals a leaflet.
>take leaflet
Taken.
>read leaflet
```

コマンドは英語で入力します。主なコマンドと保存・復帰の方法は[遊び方](PLAYING_ja.md)を参照してください。

## 5. 終わる

`quit` と入力し、確認に `y` で答えると終了します。続きを遊ぶ場合は、先に `save` で保存してください。

## 端末で `>` が2回見える場合

ゲームが表示する `>` に加えて、PyEmuera の入力欄にも `> ` が表示されます。2回見えるのは表示上の重なりで、ゲームの動作には影響しません。詳しくは[互換性と既知の制限](COMPATIBILITY_ja.md)を参照してください。
