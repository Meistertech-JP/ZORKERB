日本語 | [English](Getting-Started-English)

# はじめに

ZORKERB I・ZORKERB IIを入手して起動し、最初の数手を遊ぶまでの手順です。

## 必要なもの

- Python 3.10 以上（同梱していません）
- ZORKERB 一式（配布 ZIP、またはリポジトリ）

収録作品は、同梱の `PyEmuera-3.0.0.pyz`（未改変の PyEmuera 3.0.0）1本で動きます。

```text
8a7b3697b97155c4dc994c8349c6756bb0401000d3bbccd8e85ff046e3774b35  PyEmuera-3.0.0.pyz
```

## 1. 用意する

配布 ZIP を新しいフォルダーへ展開するか、リポジトリを取得します。以前の版を展開したフォルダーへは上書きしないでください。

```text
ZORKERB/
├── PyEmuera-3.0.0.pyz     収録作品用の実行エンジン
├── ZORKERB-I.bat          ZORKERB I を起動（Windows）
├── ZORKERB-II.bat         ZORKERB II を起動（Windows）
├── ZORKERB-I/             ZORKERB I のゲーム（ERB/、CSV/）と作品の資料
├── ZORKERB-II/            ZORKERB II のゲーム（ERB/、CSV/）と作品の資料
├── docs/                  収録作品に共通の文書
└── licenses/              ライセンスと権利表示
```

## 2. 起動する

**Windows：** `ZORKERB-I.bat` または `ZORKERB-II.bat` をダブルクリックします。Python が見つからないときは、その旨を表示して止まります。

**そのほかの環境：** `PyEmuera-3.0.0.pyz` があるフォルダーで、作品のフォルダーを指定して実行します。

```console
python3 PyEmuera-3.0.0.pyz ZORKERB-I
python3 PyEmuera-3.0.0.pyz ZORKERB-II
```

`python3` がない環境では `python` を使ってください。

## 3. タイトル画面

```text
ZORK I: The Great Underground Empire
ZORKERB r30 -- Native eraBASIC port
Original game: Infocom.
[0] New game  [1] Restore  [9] Quit
```

ZORKERB II では、1行目が `ZORK II: The Wizard of Frobozz`、2行目が `ZORKERB II -- Native eraBASIC port` です。

`0` で新しいゲーム、`1` で保存したゲームの読み込み、`9` で終了です。

## 4. 最初の数手（ZORKERB I）

```text
West of House
You are standing in an open field west of a white house, with a boarded
front door.
There is a small mailbox here.
>open mailbox
Opening the small mailbox reveals a leaflet.
>take leaflet
Taken.
```

ZORKERB II は `Inside the Barrow`（古墳の中）から始まります。コマンドは英語で入力します。主なコマンドと保存・復帰は[遊び方](Playing)を参照してください。

## 5. 終わる

`quit` と入力し、確認に `y` で答えると終了します。続きを遊ぶ場合は、先に `save` で保存してください。

## 端末で `>` が2回見える場合

ゲームが表示する `>` に加えて、PyEmuera の入力欄にも `> ` が表示されます。2回見えるのは表示上の重なりで、ゲームの動作には影響しません。詳しくは[互換性と既知の制限](Compatibility-and-Limitations)を参照してください。
