require 'spec_helper'

describe command('createrepo -V') do
  its(:stdout) { should match '0.4.9' }
  its(:exit_status) { should eq 0 }
end
