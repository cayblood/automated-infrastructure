# Create home directory for the account
directory "/tmp/testdir" do
  mode 0777
  action :create
end