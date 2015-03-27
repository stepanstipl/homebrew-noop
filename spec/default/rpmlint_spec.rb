require 'spec_helper'

describe command('rpmlint -V') do
  its(:stdout) { should match 'rpmlint version 1.6' }
  its(:exit_status) { should eq 0 }
end
