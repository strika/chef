log "Running 'provision' recipe from the acceptance-cookbook in directory '#{node["chef-acceptance"]["suite-dir"]}'"

test_run = "#{node["chef-acceptance"]["suite-dir"]}/test_run"

# Grab the cookbook
cookbook_name = "git"
directory test_run
# TODO grab the source url from supermarket. Super sad we have to do this.
git "#{test_run}/#{cookbook_name}" do
  repository "https://github.com/chef-cookbooks/#{cookbook_name}.git"
end

# Run the test on the current platform
execute "kitchen converge default-windows-server-2012r2" do
  cwd "#{test_run}/#{cookbook_name}"
  env "KITCHEN_LOCAL_YAML" => "#{node["chef-acceptance"]["suite-dir"]}/.kitchen.vagrant.yml"
end
