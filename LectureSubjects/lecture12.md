## AWSフルコース第12回課題

### CircleCIのサンプル設定ファイルをプロジェクトに組み込み動作するようにする
- [CircleCIスタートガイド](https://circleci.com/docs/ja/getting-started/)に沿ってプロジェクトと紐付け
- config.ymlを.circleci配下に配置
- circleci CLIをローカルにインストール
    - windowsにインストールの場合`choco install circleci-cli -y`
    - 管理者権限でのインストールが必要なためPowerShellに`gsudo`をインストール
    - `gsudo choco install circleci-cli -y`でPowerShellを管理者権限で開かなくてもインストール可能

### 動作確認
**configファイルにわざと不正な半角スペースを入れた場合**
![failed](/images/lecture12/failed-validate2023-10-02.png)
  
  
**configファイルを修正後**
![valid](/images/lecture12/valid2023-10-02.png)
  
  

**GitHubに変更をプッシュCircleCI**
![circleci](/images/lecture12/circleci-pipelines2023-10-02.png)
