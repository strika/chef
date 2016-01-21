log "Running 'verify' recipe from the acceptance-cookbook in directory '#{node['chef-acceptance']['suite-dir']}'"

# Install vagrant
include_recipe 'vagrant'

# Run the test
test_run = "#{node["chef-acceptance"]["suite-dir"]}/test_run"
# Run the test on the current platform
execute "kitchen verify default-ubuntu-1404" do
  cwd "#{test_run}/#{cookbook_name}"
  env "KITCHEN_LOCAL_YAML" => "#{node["chef-acceptance"]["suite-dir"]}/.kitchen.ec2.yml"
end
