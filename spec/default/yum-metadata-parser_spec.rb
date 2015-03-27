require 'spec_helper'

describe command('python -c "import sqlitecachec"') do
  its(:stderr) { should eq '' }
  its(:exit_status) { should eq 0 }
end
