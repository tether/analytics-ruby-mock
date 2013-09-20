analytics-ruby-mock
===================

Capture all calls to Segment.io and prevent them from going to the server. Great for keeping your tests connection free!

Installation
----

```
gem install analytics_ruby_mock
```

Usage
----

Add `analytics_ruby_mock` to your gemfile:

```ruby
gem 'analytics_ruby_mock', group: :test
```

Require analytics_ruby_mock in your `spec_helper`:

```ruby
require 'analytics_ruby_mock'
```

That's it!

Debugging
----

If you'd like to see your calls output to console while being run, call the `debug` method:

```ruby
Analytics.debug
```

You'll get an output message any time a method on Analytics is called.

===

Proudly brought to you by [PetroFeed](http://PetroFeed.com). Pull requests and issues always welcome. :kissing_heart:
