require 'spec_helper'

describe command('rpm --version') do
  its(:stdout) { should match 'RPM version 4.12.0.1' }
  its(:exit_status) { should eq 0 }
end
