AWS-SSH
-----

A tool that makes easy to ssh into AWS EC2 servers

There's a blog post at [rafaelsales.github.io](https://rafaelsales.github.io/ruby/sqlite/threadsafe/concurrency/2015/08/18/aws-ssh/)
with some useful examples of using it:

### Usage

```
$ gem install aws-ssh
$ bundle exec aws-ssh --help

aws-ssh - a tool that makes easy to ssh into AWS EC2 servers

Usage: aws-ssh [hostname regex]

Examples:
  $ aws-ssh prod.*app2
  ... will SSH into the instance and you will see:
  user@prod-rails-app4~$

  $ aws-ssh --show-only --stack qa -u worker
  ... will show all instances registered in QA stack of Opsworks
  ssh worker@10.20.30.40        => MyApp QA - qa-rails-app
  ssh worker@10.20.30.41        => MyApp QA - qa-sidekiq

  # All hosts in one-line (suitable for CSSH):
  worker@10.20.30.40 worker@10.20.30.41

Options:
    -s, --stack        AWS OpsWorks Stack name regex. E.g: `-s prod` will match "Production" stack name
    -p, --profile      AWS config profile name. Default: profile set in .aws-ssh file
    -r, --region       AWS region. E.g: us-east-1. Default: region set in .aws-ssh file
    -u, --user         SSH username to use. Default: user set in .aws-ssh file or current machine user
    -so, --show-only   Only show the matched hosts instead of ssh. Default: false
    -cs, --csensitive  Use case-sensitive for regex matching. Default: false
    -v, --verbose      Verbose mode. Default: false
    --help             Shows help
```

**SSH into multiple servers at once**

You can observe the last line of the output contains a whitespace-separated list of servers. We can use that as an input to a Cluster-SSH tool in order to SSH into multiple servers at once. I’m gonna use [tmux-cssh](https://github.com/dennishafemann/tmux-cssh) for example:

```sh-session
$ tmux-cssh $(aws-ssh -so prod.*app | tail -1)
```

You can also create an alias your bash/zsh initialization script to make this even more handy:

Define the alias:

```
alias tmux_aws="tmux_aws_fn"
tmux_aws_fn() {
  tmux-cssh $(aws-ssh -so $1 | tail -1)
}
```

Now you can just do `tmux_aws prod.*app` to SSH into all servers that match this regex


DEFAULT OPTIONS
---------------

Use the [.aws-ssh.sample](https://github.com/rafaelsales/aws-ssh/blob/master/.aws-ssh.sample) as
template to set default options.

Contributing
------------

1. Fork it ( https://github.com/rafaelsales/aws-ssh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

License
-------

Please see [LICENSE](https://github.com/rafaelsales/aws-ssh/blob/master/LICENSE) for licensing details.
