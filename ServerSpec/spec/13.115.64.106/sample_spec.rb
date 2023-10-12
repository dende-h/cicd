require 'spec_helper'


# Nginxの起動状態
describe service('nginx') do
  it { should be_running }
end
