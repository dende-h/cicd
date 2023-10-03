## AWSコース第13回課題「CircleCIにAnsilbleやServerSpecの処理を追加」

### terraformで環境構築
**terraformのインストール**
chocolateyを使用してインストール実施
![choco](./images/lecture13/install_terraform2023-10-02.png)
![terraform-i](./images/lecture13/install-terraform2023-10-02.png)
![tflint-i](./images/lecture13/install_tflint2023-10-02.png)
![install-v](./images/lecture13/install-v2023-10-02.png)
**terraform拡張機能インストール**
![plugin](./images/lecture13/vscode-plugin2023-10-02.png)

**terraformメモ**
- 環境ごとに構築する場合
    - 環境ごとのディレクトリにそれぞれmain.tfを作成
    - 環境のカレントディレクトリでterraform init
    - planでチェック、applyで構築、destroyで消去
- モジュール間でリソースや変数を使いたい場合の方法
    - ルートのmain.tfでモジュールを参照する際は、モジュールのパス
    - モジュール内で他のモジュールのリソースや変数を参照する場合outputs.tfに定義
    - 他のモジュールのoutputsを受け取る側はvariables.tfに変数として定義
    - ルートのmain.tfでモジュールを呼ぶ際に、他のモジュールのアウトプットを変数に渡す
- CloudFormationでセキュリティグループのegressで指定したDestinationSecurityGroupIdはなく、source_security_group_idを使う
### コンテナによるAnsilble実行環境の構築
**Docker for windowsを使用する**

‐ Docker for windowsのインストール
    
