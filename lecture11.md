## 第11回追加課題
### テストの実行

| テストケースパターン | 解説 |
|----------------------|------|
| `it { should be_installed }` | 対象がインストールされていることを確認。主にパッケージに対して使用。 |
| `it { should be_enabled }` | 対象のサービスが有効化されていることを確認。 |
| `it { should be_running }` | 対象のサービスやプロセスが実行中であることを確認。 |
| `it { should be_listening }` | 対象のポートがリッスン状態であることを確認。 |
| `it { should be_reachable }` | 対象のホストやポートが到達可能であることを確認。 |
| `it { should exist }` | 対象のファイルやディレクトリ、ユーザーなどが存在することを確認。 |
| `it { should be_directory }` | 対象がディレクトリであることを確認。 |
| `it { should be_mode 755 }` | 対象のファイルやディレクトリのパーミッションが755であることを確認。 |
| `its(:content) { should match /parameter=value/ }` | 対象のファイルの内容が指定した正規表現にマッチすることを確認。 |
| `its(:stdout) { should match /^200$/ }` | コマンドの標準出力が指定した正規表現にマッチすることを確認。 |
| `its(:exit_status) { should eq 0 }` | コマンドの終了ステータスが0（成功）であることを確認。 |
| `it { should_not be_running }` | 対象のサービスやプロセスが実行中でないことを確認。 |
