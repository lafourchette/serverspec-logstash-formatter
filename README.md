# Serverspec logstash formatter

[![Gem Version](https://badge.fury.io/rb/serverspec-logstash-formatter.svg)](https://rubygems.org/gems/serverspec-logstash-formatter)

A logstash formatter for [serverspec](http://serverspec.org)

Installation
--------------------------------------------------------------------------------

First:

```ruby
gem install serverspec-logstash-formatter
```

or in your Gemfile

```ruby
gem 'serverspec-logstash-formatter
```

Then, when running rspec:

```
rspec --format logstash
```

Or, if you want to use the logstash formatter as your default formatter, simply put the options in your `.rspec` file:

    --format logstash
