require 'spec_helper'

describe 'borg' do
  let :node do
    'rspec.puppet.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_file('/opt/teamspeak3') }
        it { is_expected.to contain_file('/opt/teamspeak/downloads3') }
        it { is_expected.to contain_class('teamspeak::install') }
        it { is_expected.to contain_class('teamspeak::service') }
        it { is_expected.to contain_user('teamspeak') }
        it { is_expected.to contain_group('teamspeak') }
      end
    end
  end
end
