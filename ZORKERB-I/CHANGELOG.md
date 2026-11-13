# Changelog

各版の主な変更です。r30 と r29 の詳細は [RELEASE_NOTES.md](RELEASE_NOTES.md) にあります。

Main changes by revision. See [RELEASE_NOTES.md](RELEASE_NOTES.md) for r30 and r29.

## r30

- 実行エンジンを PyEmuera 3.0.0 正式版（未改変）に更新。ゲームの処理は r29 と同じで、タイトル表示だけが r30 になります / Engine updated to the PyEmuera 3.0.0 release (unmodified). The game is the same as r29; only the title line says r30
- r29 のセーブをそのまま読み込めます（セーブ形式29） / Saves from r29 load unchanged (save format 29)
- 最終検証を 3.0.0 でやり直し、r29 と同じ結果 / Final verification repeated on 3.0.0 with the same results as r29

## r29

- 原作 story の辞書と構文表、gparser.zil の手順による構文解析 / Parser driven by the original dictionary and syntax table, following gparser.zil
- 原作の辞書にある未実装の動詞を追加 / Verbs from the original dictionary that were missing
- Z-machine と同じ乱数の引き方と `#random` / Z-machine random draws and `#random`
- 表示、終了処理、入力バッファ、Loud Room の入力ループを原作に合わせた / Original display, endings, input buffer and Loud Room input loop
- 開発版の表記をタイトルから削除 / Development banner removed from the title
- セーブ形式29（r28以前のセーブは読み込めない） / Save format 29 (saves from r28 and earlier are rejected)

## r1–r28

以前の版です。開発記録は開発用リポジトリに保存しています。

Earlier revisions. Their development records are kept in the development repository.
