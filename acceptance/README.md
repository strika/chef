# Acceptance Testing for Chef Client
This folder contains acceptance tests that are required for Chef client
release readiness.

## Getting started
The tests use the [chef-acceptance](https://github.com/chef/chef-acceptance) gem as the high level framework.
All the gems needed to run these tests can be installed with Bundler.

### Important Note!
If you are using Chef Development Kit's ruby environment make sure you  do the following on your current session:

```
export APPBUNDLER_ALLOW_RVM=true
```

### Setting up and running a test suite

You should be in the `chef/acceptance` folder to run acceptance tests. Once in this folder, you can run:

```shell
$ bundle install
$ # get some basic info about chef-acceptance
$ bundle exec chef-acceptance info
$ # Run a particular suite
$ bundle exec chef-acceptance test TEST_SUITE
```

Acceptance tests are configured to run either in EC2 or in Vagrant:

| test suite| backend  |
|-----------|----------|
| trivial   | vagrant  |
| gem_versions | EC2 |

When running tests on Vagrant make sure that:

* Vagrant is installed.
* Virtual Box, VMWare Fusion or your choice of virtualization is installed.

When running tests on EC2 make sure that:

* You have the correct [AWS configuration](https://github.com/test-kitchen/kitchen-ec2/#authenticating-with-aws).
* You set `AWS_SSH_KEY_ID` environment variable to your EC2 keypair name and have your public key at:
  * `"#{ENV["HOME"]}/.ssh/ #{ENV["AWS_SSH_KEY_ID"]}.pem"`
