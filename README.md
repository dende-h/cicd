# RaiseTech課題用リポジトリ
このリポジトリは**RaiseTechのAWSフルコースの提出課題用**に作成されました。
lecture.mdファイルは課題を通して学んだことの証跡となります。

## 目次
- [取り組み内容](#取り組み内容)
- [成果物](#成果物)
- [How to use](#how-to-use)
- [RaiseTechの課題について](#raisetechの課題について)

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

## How to use
下記の手順で環境の構築とアプリのデプロイを行うことができます。  
**前提条件**
- CircleCIのアカウントを持っていること 
- CircleCIのアカウントと紐付けられる自身のGitHubアカウントを持っていること
- AWSのアカウントを持っており、手動でリソースの構築ができること
    - 今回の手順ではEC2キーペアとS3Bucketの手動構築が必要
  
**設定手順**
1. [このリポジトリを自身のリポジトリにフォークして、CircleCIにセットアップする](#1-このリポジトリを自身のリポジトリにフォークしてcircleciにセットアップする)
2. [AWSのコンソールでキーペアを作成(使えるキーペアがない場合)](#2-awsのコンソールでec2用のキーペアを作成使えるキーペアがない場合)
3. [AWSのコンソールでS3bucket(terraformの状態を管理するbucketを作成)](#3-awsのコンソールでs3bucketterraformの状態を管理するbucketを作成)
4. [terraformに許可する権限を持ったIAMユーザーのアクセスキーとシークレットキーを作成](#4-terraformに許可する権限を持ったiamユーザーのアクセスキーとシークレットキーを作成)
5. [CircleCIに必要な環境変数を登録する](#5-circleciに必要な環境変数を登録する)
6. [terraformの変数を自身の環境用にオーバーライドする](#6-terraformの変数を自身の環境用にオーバーライドする)
7. [変更をコミットしGitHubにPushする](#7-変更をコミットしgithubにpushする)   
  
##### 1. このリポジトリを自身のリポジトリにフォークして、CircleCIにセットアップする
- このリポジトリを下記のボタンから自身のリポジトリにForkします。  
    ![fork](/images/readme/fork.png)  
  
- Forkしたリポジトリを自身のローカル環境にCloneして変更してください。  
    ![clone](/images/readme/clone.png)  
  
- VScodeを使用する場合下記の拡張機能をインストールして有効化してください。  
    ![yaml](/images/readme/yaml.png)  
    ![terraform](/images/readme/terraform.png)  
  
##### 2. AWSのコンソールでEC2用のキーペアを作成(使えるキーペアがない場合)
既存で利用できるEC2のssh接続用キーペアがない場合は作成します。  
既存のものを使用する場合はこの手順は不要です。  
[ドキュメント](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/create-key-pairs.html#having-ec2-create-your-key-pair)にしたがってキーペアを作成してください。
##### 3. AWSのコンソールでS3bucket(terraformの状態を管理するbucketを作成)
このプロジェクトでは構築したterraformのリソースの状態をAmazonS3に保存します。  
その保存のためのS3bucketを構築します。  
[ドキュメント](https://docs.aws.amazon.com/ja_jp/AmazonS3/latest/userguide/creating-bucket.html)にしたがってS3を作成してください。  
名前とリージョン以外はdefault値でも大丈夫です。  
名前はグローバルで一意なものを、命名規則にしたがって設定してください。  
リージョンは環境を構築するリージョンを選んでください。
##### 4. terraformに許可する権限を持ったIAMユーザーのアクセスキーとシークレットキーを作成
既存の利用可能なアクセスキーとシークレットキーがある場合この手順は不要です。  
新規に作成する場合は[ドキュメント](https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/id_credentials_access-keys.html) を読んで適切な権限を付与したユーザーを作成してください。  
削除前提で試すだけなら、```AdministratorAccess```でも大丈夫です。  
アクセスキーとシークレットキーの漏洩に注意して下さい。
##### 5. CircleCIに必要な環境変数を登録する
CircleCIのProjectSettingsに必要な環境変数を登録します。  
![project_settings](/images/readme/project_settings.png)  
  
ProjectSetteingsからSSH Keys → Addtional SSH keys → Add SSH keyへ進んで2の手順でローカルに保存した秘密鍵の中身をコピーして追加します。
![add_btn](/images/readme/add_ssh_btn.png)  
![add_key](/images/readme/add_ssh_key.png)  
  
  
秘密鍵の文字列は下記のように全文をコピーして貼り付けてください。  
ホスト名はblankでも大丈夫です。  
```
-----BEGIN OPENSSH PRIVATE KEY-----

ssh key strings

-----END OPENSSH PRIVATE KEY-----
```
登録後の画面で表示されるFingerPrintをコピーしておいてください。  
![finger_print](/images/readme/finger_print.png)
  
  
続いて同じprojectSettingsからEnvironment Variables → Add Environment Variableから環境変数を追加していきます  
下図のように4つの変数を登録します  
![add_env_var](/images/readme/add_env_var.png)  
  
  ```
AWS_ACCESS_KEY_ID
    手順4で作成したAWSのIAMユーザーのアクセスキーを登録します

AWS_SECRET_ACCESS_KEY
    手順4で作成したAWSのIAMユーザーのシークレットキーを登録します

KEY_FINGERPRINT
    直前の手順でコピーしたFingerPrintを登録します

TF_VAR_rds_password	
    構築するRDS/MySQLのパスワードを登録します。
  ```
##### 6. terraformの変数を自身の環境用にオーバーライドする
下記の```/teraform/environments/development/main.tf```の変数を一部自身の環境に合わせて変更してください。
```hcl
provider "aws" {
  # リージョンを自身の利用しているものに設定してください
  region = "ap-northeast-1"
}

module "network" {
  source = "../../modules/network" #　モジュールのパスを指定
# 必要に応じて変数をオーバーライドしてください
  # vpc_cidr_block = "10.0.0.0/24"
  # vpc_name = "terraform-VPC"
  # igw_name = "terraform-IGW"
  # public_subnet_route_table_name = "terraform-public-RouteTable"
  # public_subnet1_cidr_block = "10.0.0.0/28"
  # public_subnet2_cidr_block = "10.0.0.16/28"
  # public_subnet1_name = "terraform-public-subnet1"
  # public_subnet2_name = "terraform-public-subnet2"
  # praivate_subnet_route_table_name1 = "terraform-praiavte-RouteTable1"
  # praivate_subnet_route_table_name2 = "terraform-praiavte-RouteTable2"
  # private_subnet1_cidr_block =  "10.0.0.128/28"
  # private_subnet2_cidr_block = "10.0.0.144/28"
  # praivate_subnet1_name = "terraform-praivate-subnet1"
  # praivate_subnet2_name = "terraform-praivate-subnet2"
  # aws_region = "ap-northeast-1"
  # vpc_endpoint_name = "terraform_vpc_endpoint"
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.network.vpc_id
# 必要に応じて変数をオーバーライドしてください
  my_ip = ["0.0.0.0/0"] #指定したIPアドレス以外からの通信をブロックするように設定。自身のローカルPCのIPを指定するとセキュアです。
  # alb_sec_group_name = "alb-sec-terraform"
  # alb_sec_group_description = "security for alb access"
  # ec2_sec_group_name = "ec2-sec-terraform"
  # ec2_sec_group_description = "security for ec2 access"
  # rds_sec_group_name = "rds-sec-terraform"
  # rds_sec_group_description = "security for rds access"
  # alb_ingress_port = 80
  # ec2_ingress_port = 22
  # rds_ingress_port = 3306
  # protocol = "tcp"
}

module "load_balancer" {
  source            = "../../modules/load_balancer"
  vpc_id            = module.network.vpc_id
  public_subnet1_id = module.network.public_subnet1_id
  public_subnet2_id = module.network.public_subnet2_id
  alb_sec_group_id  = module.security.alb_sec_group_id
  port              = module.security.alb_ingress_port
  target_ec2        = module.compute.ec2_instance_id
# 必要に応じて変数をオーバーライドしてください
  # alb_name = "terraform-alb"
  # alb_target = "terraform-alb-target"
}

module "compute" {
  source            = "../../modules/compute"
  ec2_subnet1       = module.network.public_subnet1_id
  sec_group_for_ec2 = [module.security.ec2_sec_group_id]
# 必要に応じて変数をオーバーライドしてください
  # role_name = "terraform-ec2-IamRole"
  # policy_arns =  ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
  # profile_name = "terraform-ec2-instance-profile"
  # instance_type = "t2.micro"
  # ami = "ami-07d6bd9a28134d3b3"


#事前に作成したキーペア名を指定してください。キーペアが存在しない場合失敗します。
  keypair_name = <<"your-key-pair-name">> 


  # volume_type = "gp2"
  # volume_size = 8
  # ec2_name = "terraform-ec2"
}

module "database" {
  source                     = "../../modules/database"
  subnet_ids                 = module.network.praivate_subnet_ids
  rds_vpc_security_group_ids = [module.security.rds_sec_group_id]
# 必要に応じて変数をオーバーライドしてください
  # subnet_group_name = "terraform-subnet-group"
  # rds_allocated_storage = 20
  # rads_storage_type = "gp2"
  # rds_engine = "mysql"
  # rds_engine_version = "8.0.33"
  # rds_instance_class = "db.t3.micro"
  # rds_name = "terraformRds"
  # rds_username = "root"
  # rds_parameter_group_name = "default.mysql8.0"
  # rds_port = 3306
}

module "storage" {
  source = "../../modules/storage"


# s3バケット名を自身で決めた名前に上書きしてください。既に存在する名前の場合失敗します。
  s3_bucket_name = << "your-s3-bucket-name" >>


}  


```
```keypair_name```と```s3_bucket_name```の二つは変更必須です。  
  




##### 7. 変更をコミットしGitHubにPushする 
手順6の変更を保存したら、commitをリモートリポジトリにpushします。
CircleCIのダッシュボードで```terraform-build-and-deploy```ワークフローが起動したか確認してください。

## Raisetechの課題について
##### Raisetechの課題は下記の原則のもと進めていきます

- RaiseTech では現場と同じ依頼の粒度で課題を出す
- 原則、細かい指示はない
- 指示のない部分を考え、積極的に質問していただくことが現場でのベーススキルになる

#### 課題の進捗状況は以下の通りです。
##### AWSフルコースカリキュラムと課題状況（全16回講座）
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


