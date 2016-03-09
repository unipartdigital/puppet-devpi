require 'spec_helper'

provider = {
  6 => 'upstart',
  7 => 'systemd'
}

describe 'devpi' do

  [6,7].each do |osmaj|
    context "on RedHat#{osmaj}" do
      let(:facts) do
        {
          :operatingsystemmajrelease => osmaj
        }
      end

      context "with defaults for all parameters" do

        it { should compile.with_all_deps }
        it { should_not contain_package('devpi-client') }
        it { should contain_package('devpi-server') }
        it { should contain_service('devpi-server').with(
            :provider => provider[osmaj]
          )
        }
        it { should contain_user('devpi') }
        it { should contain_file('/opt/devpi') }
        if osmaj == 6 then
          it {
            should contain_file('/etc/init/devpi-server.conf')
              .with_content(/exec sudo -E -u devpi devpi-server --host 0.0.0.0 --port 3141 --serverdir \/opt\/devpi\n/)
          }
          it {
            should_not contain_class('devpi::config').that_notifies('Class[devpi::systemd]')
          }
        elsif osmaj == 7 then
          it {
            should contain_file('/usr/lib/systemd/system/devpi-server.service')
              .with_content(/User=devpi\nGroup=devpi\nExecStart=\/usr\/bin\/devpi-server --host 0.0.0.0 --port 3141 --serverdir \/opt\/devpi\n/)
          }
          it {
            should contain_class('devpi::config').that_notifies('Class[devpi::systemd]')
          }
        end
      end

      context 'with client => true' do
        let :params do {
          :client  => true
        } end

        it { should compile.with_all_deps }
        it { should contain_package('devpi-client') }
      end

      context 'with virtualenv => /venv' do
        let :params do {
          :virtualenv => '/venv'
        } end

        it { should compile.with_all_deps }
        it { should_not contain_class('devpi::package') }
        if osmaj == 6 then
          it {
            should contain_file('/etc/init/devpi-server.conf')
              .with_content(/exec sudo -E -u devpi \/venv\/bin\/devpi-server --host 0.0.0.0 --port 3141 --serverdir \/opt\/devpi\n/)
          }
        elsif osmaj == 7 then
          it {
            should contain_file('/usr/lib/systemd/system/devpi-server.service')
              .with_content(/User=devpi\nGroup=devpi\nExecStart=\/venv\/bin\/devpi-server --host 0.0.0.0 --port 3141 --serverdir \/opt\/devpi\n/)
          }
        end
      end

    end
  end


end
