# README



* Git を汚く使う
* 疑問点を記述しておくこと
  - task#destory の redirect_to の書き方
    - redirect_to :index ?

- TODO
  - ~comments#edit の実装
    - task#show の中でformに変わるようにしたい
      - Ajaxの知識が必要らしい
    - shallow path の罠にハマった
  - ~レイアウトの実装
  - ~バリデーションの実装
  - ~ソートの実装
  - ~ページネーション
  - タスクの優先度の追加
  - top page の追加
    - 綺麗な画像が欲しい...
    - だから、ひとまずの写真で作ってみる
  - ユーザ登録
  - ~task#index にformの追加
  - font awesome
    - cdnを追加したので、どんどんアイコンを使用する
      - 公式ページのcdn が正しく認識されない <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
  - ~task を card で表現
  - comment の1, 2, ..と連番にするか、専用の画像を入れる
  - ~カウントダウンの表示を工夫する
    - Ajaxの知識が必要らしい
      FIXME:
      - js の setTimeout で実装
        - コードが汚すぎるのでリファクタリングが必要
    - 絶対に欠かすことのできない機能
  - ~tasks#indexに最新のコメントのみを注釈で入れる
  - ~edit destroyのボタンをBootstrap
  - datetimeをlocalの時間に対応できるように
    - 保存はutcとして、使用する時にjstで使えるようにすると良い可能性が...
      - seed で 9時間ずれるバグがある
        - 9 時間と決め打ちで実装してしまっている...
  - ~datetimeのデザインをよくする
  - Tackle iconを作る
  - ~date picker
  - seed dataの追加
    - after DD days と計算できていない
      - 汚コードで無理やり実装
  - 日程を簡単にずらせるようにする
  - flashのエラー表示をheaderに移動
  - 戻るボタンの実装
  - タスクに完了フラグの追加
  - flatpickr が画面遷移時に読み込めない時がある
