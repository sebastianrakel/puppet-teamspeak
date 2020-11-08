require 'spec_helper_acceptance'

describe 'teamspeak' do
  context 'with a teamspeak server' do
    let(:pp) do
      <<-PUPPET
      include teamspeak
      PUPPET
    end

    it 'works idempotently with no errors' do
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe service('teamspeak3.service') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
