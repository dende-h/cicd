# RaiseTech課題用リポジトリ
このリポジトリは**RaiseTechのAWSフルコースの提出課題用**に作成されました。
lecture.mdファイルは課題を通して学んだことの証跡となります。

## 取り組み内容
取り組みは主に下記の5つになります。
- AWSのVPC、EC2、RDSなどを使った基本的なクラウドインフラ環境の手動構築
- 構築した環境へRailsアプリをデプロイ(アプリは作成済みのサンプルを使用)
- 同じ環境をCloudfomationによる自動構築
- ServerSpecでインフラ環境の自動テスト
- CircleCIやAnsibleを使って、構築、環境セットアップ、サーバーテストを自動化したCI/CD環境の構築

## 成果物
### 手動構築とRailsアプリのデプロイ
詳細なまとめは下記.mdファイルを参照してください。
- [lecture04.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture04.md)
- [lecture05.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture05.md)
  
AWSの環境の構築とRailsアプリの構成は下記の図となっています。  
EC2のOSはAmazonlinux2を利用。  
RDSはMySQLでDBを作成、Private Subnetに配置しEC2のみ通信可能になるようにSecurity Groupを設定。  
RailsアプリのWEBサーバーとAPサーバーは組み込みのPumaでのデプロイとNginxとUnicornを組み合わせたデプロイの両方を実施しています。  
![AWS](/AWS-configuration-diagram/AWS構成図.drawio.png)  

### CloudFomationによる自動構築
詳細なまとめは下記.mdファイルを参照してください。
- [lecture10.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture10.md)
構築する環境は上記と同じものになります。  
Userdataセクションで構築時にscriptを走らせることで、デプロイに必要なパッケージのインストールやNginxのインストールまで行っています。  
Cloudfomationのコードは下記のディレクトリを参照してください。
- [cloudformation](https://github.com/dende-h/aws-ruby/tree/main/cloudformation)  

### CircleCIを使ったCI/CD環境の構築
詳細なまとめは下記.mdファイルを参照してください。
- [lecture11.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture11.md)
- [lecture12.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture12.md)
- [lecture13.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture13.md)
最終的に構築する内容は手動で構築したものと同じです。  
下記の図のようにリポジトリへのpushをCircleCIが検知し、AWSの構築→デプロイ環境構築→サーバーテストが行われるように自動化しています。  
AWS環境の自動化はterraformを使って作成し、AnsibleでRailsアプリのデプロイまで行っています。  
各ツールのコードは下記のディレクトリを参照してください。
- [.circleci](https://github.com/dende-h/aws-ruby/tree/main/.circleci)  
- [terraform](https://github.com/dende-h/aws-ruby/tree/main/terraform)  
- [ansible](https://github.com/dende-h/aws-ruby/tree/main/ansible)  
- [ServerSpec](https://github.com/dende-h/aws-ruby/tree/main/ServerSpec)  

![diagram](/AWS-configuration-diagram/AWS課題構成図lecture13.drawio.png) 



### Raisetechの課題について
**Raisetechの課題は下記の原則のもと進めていきます**

- RaiseTech では現場と同じ依頼の粒度で課題を出す
- 原則、細かい指示はない
- 指示のない部分を考え、積極的に質問していただくことが現場でのベーススキルになる

## 課題の進捗状況は以下の通りです。
### AWSフルコースカリキュラムと課題状況（全16回講座）
1. AWSで環境構築【2023/08/17：提出済み】[lecture01_ruby_helloworld](https://github.com/dende-h/aws-ruby/tree/main/LectureSubjects/lecture01_ruby_helloworld)
    - AWSアカウント作成
    - IAMユーザーを作成し推奨設定(MFA、Billing、権限ポリシー)
    - Cloud9の作成(AmazonLinux2)
    - 作成したCloud9でRubyを使ってhelloWordを出力　
2. バージョン管理システム【2023/08/19：提出済み】[lecture02.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture02.md)
    - Cloud9上でGitをインストールしてGitHubにプッシュ
    - gitの設定変更(username,mail,initBranch)
    - マークダウンファイルに講義内容のまとめなど作成してプルリクエスト発行
3. Webアプリケーションとは【2023/08/21：提出済み】[lecture03.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture03.md)
    - サンプルアプリケーションをGitHubからCloneして起動(デプロイ)
        - アプリケーションが使うDBエンジンがあるかの確認、無かったらインストール
        - 構成管理ツールでGemのインストール
        - 起動
        - ブラウザでの接続確認
    - APサーバー、DBサーバーについて調べ、今回の課題で学んだことまとめ
    - まとめたものをプッシュしてプルリクエスト
4. AWS管理権限、VPC、サブネット、EC2、RDS【2023/08/28：提出済み】[lecture04.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture04.md)
    - AWS上でVPCを作って、EC2とRSDを構築
    - EC2 から RDS へ接続をし、正常であることを確認して報告
5. EC2にアプリデプロイ、ELB、S3、インフラ構成図【2023/09/08：提出済み】[lecture05.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture05.md)
    - EC2に第3回課題のサンプルアプリをデプロイ
        - まずは組み込みサーバーで動かしてみる
        - サーバーとアプリに分けて動かしてみる
    - ELBの追加
    - S3の追加
    - ここまでが正しく動作したらその環境を構成図に書き起こす
6. AWSでのロギング、監視、通知、コスト管理【2023/09/13:提出済み】[lecture06.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture06.md)
    - 最後にAWSを利用した日の記録を、CloudTrailのイベントから探し出す
        - 自身のIAMユーザー名があるものでOK
        - 見つけたイベントの中にはどんな情報が含まれているかイベント名と、含まれている内容3つをピックアップ
    - CloudWatchアラームを使って、ALB のアラームを設定して、メール通知
        - メールにはAmazonSNSを使う。OKアクションも設定
        - アラームとアクションを設定した状態で、Railsアプリケーションが使える、使えない状態にして、動作を確認
    - AWS利用料の見積を作成
        - 今日までに作成したリソースの内容を見積り
    - マネジメントコンソールから、現在の利用料を確認
        - 先月の請求情報から、EC2の料金がいくらか確認
7. セキュリティの基礎、AWSでのセキュリティ対策【2023/09/16：自由課題提出】[lecture07.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture07.md)
    - 自由課題として、これまで構築した環境の脆弱性と対策について考える
    - lecture07.mdに講義内容と一緒にまとめる
8. 構築の実演1【課題無し】
    - 自身の構築と比べて気づいたこと 
9. 構築の実演2【課題無し】
    - 自身で組み込みサーバーからWEB＆APサーバーへの変更を試してみる
10. インフラの自動化、CloudFormation【2023/09/27：提出済み】[lecture10.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture10.md)
    - CloudFormation を利用して、現在までに作った環境をコード化
    - コード化ができたら実行してみて、環境が自動で作られることを確認
11. インフラのコード化、インフラのテスト【2023/09/30:提出済み】[lecture11.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture11.md)
    - ServerSpecのサンプルコードをカスタマイズしてテスト成功させる
12. Teraform、DevOps、CI/CDツール【2023/10/02:提出済み】[lecture12.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture12.md)
    - CircleCIのサンプルコンフィグを正しく動作するようにリポジトリに組み込む
13. Ansible、OpsWorks、CircleCI（講座内の最終課題）【2023/10/12:提出済み】[lecture13.md](https://github.com/dende-h/aws-ruby/blob/main/LectureSubjects/lecture13.md)
    - CircleCIにAnsilbleやServerSpecの処理を追加
14. ライブコーディング（Ansible〜CircleCI）
15. ライブコーディング（Ansible〜CircleCI）
16. 現場へ出ていくにあたって必要な技術と知識
