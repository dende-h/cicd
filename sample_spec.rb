require 'spec_helper'

listen_port = 80

%w{git make gcc-c++ patch openssl-devel libyaml-devel libffi-devel libicu-devel libxml2 libxslt libxml2-devel libxslt-devel zlib-devel readline-devel ImageMagick ImageMagick-devel epel-release nginx unicorn mysql-devel}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# describe package('nginx') do
#   it { should be_installed }
# end

# describe package('unicorn') do
#   it { should be_installed }
# end

# describe package('mysql2') do
#     it { should be_installed }
#   end

describe port(listen_port) do
  it { should be_listening }
end

# 指定されたURLに対してHTTPリクエストを送信し、レスポンスのHTTPステータスコードが200（成功）であることを確認するテスト。レスポンスボディの内容は確認せず、HTTPコードを対象とする。
describe command('curl http://Lecture10-alb-1385515351.ap-northeast-1.elb.amazonaws.com -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end