require 'spec_helper'
describe 'devpi' do

  context 'with defaults for all parameters' do
    it { should compile.with_all_deps }
    it { should_not contain_package('devpi-client') }
    it { should contain_package('devpi-server') }
    it { should contain_service('devpi-server') }
    it { should contain_user('devpi') }
    it { should contain_file('/opt/devpi') }
    it { should contain_file('/etc/init/devpi-server.conf').with_content(/exec su - devpi -c "devpi-server --host 0.0.0.0 --port 3141 --refresh 3600 --serverdir \/opt\/devpi"\n/) }
  end

  context 'with client => true' do
    let :params do {
      :client  => true
    } end

    it { should compile.with_all_deps }
    it { should contain_package('devpi-client') }
  end

end
