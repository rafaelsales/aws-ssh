# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'aws-ssh'
  gem.summary       = 'A tool that makes easy to ssh into AWS EC2 servers'
  gem.description   = gem.summary
  gem.authors       = ['Rafael Sales']
  gem.email         = ['rafaelcds@gmail.com']
  gem.homepage      = 'https://github.com/rafaelsales/aws-ssh'
  gem.license       = 'MIT'
  gem.version       = '1.2.0'
  gem.executables   = ['aws-ssh', 'awssh']

  gem.add_dependency  'slop', '~> 4'
  gem.add_dependency  'aws-sdk-ec2', '~> 1'
  gem.add_dependency  'nokogiri', '>= 1.11.0'
end
