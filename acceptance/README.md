# Acceptance Tests for chef

This directory contains acceptance tests for Chef Client. These tests run in Chef's release infrastructure. They are also runnable from CLI.

```
$ cd acceptance
$ bundle install
$ bundle exec chef-acceptance test gem_versions
```

Note:

* If you are using Chef Development Kit's ruby environment make sure you set this environment variable:
  `export APPBUNDLER_ALLOW_RVM=true`
* Correct [AWS configuration](https://github.com/test-kitchen/kitchen-ec2/#authenticating-with-aws) is required to run these tests.

# todo list to run acceptance tests in Jenkins:

- [*] basic acceptance tests against EC2. Get it working locally.
- [ ] integrate acceptance slave into chef's test matrix.
- [ ] How to transport the EC2 secrets to the acceptance slave?
- [ ] Run chef-acceptance from verify-chef.sh on the acceptance slave.
  -  Think about running acceptance tests from within the package (including verify-chef.sh)?
- [ ] How to hit artifactory from VPN? Use unstable in kitchen.yml.
  - Parametrize the subnet, security groups with ENV vars.
- [ ] What are the tags / etc... that we need to add to the VMs we're provisioning in EC2?
