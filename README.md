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

Asserting on Analytics
----

Analytics Ruby Mock provides you with the ability to test whether a call has occurred during your tests via counters.
The following counters are available for you to check against: `track_count`, `identify_count`, and `alias_count`.
Here's an example usage:

```ruby
describe 'show' do
  before :each do
    get :show, id: @company.id
  end

  it { Analytics.track_count.should == 1 }
end
```

If this is something you decide to use, you'll need to clear the counts at the end of your tests. You can do that by
calling `Analytics.clear_counts`. We keep that call in our `spec_helper`:

```ruby
config.after(:each) do
  Analytics.clear_counts
end
```

_Future plans would be to move that into a session so that the `clear_counts` could be removed._

Debugging
----

If you'd like to see your calls output to console while being run, call the `debug` method:

```ruby
Analytics.debug
```

You'll get an output message any time a method on Analytics is called.

===

Proudly brought to you by [PetroFeed](http://PetroFeed.com). Pull requests and issues always welcome. :kissing_heart:


![Pedro](https://www.petrofeed.com/img/company/pedro.png)
