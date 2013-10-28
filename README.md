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

Analytics Ruby Mock provides you with the ability to test whether an Analytics call has occurred during your tests.
The following accessors are available for you to check against: `track_calls`, `identify_calls`, and `alias_calls`.
All 3 methods collect the options passed to their respective calls and holds them in an array. Here's an example usage:

```ruby
describe 'show' do
  before :each do
    get :show, id: @company.id
  end

  it "calls track for analytics" do
    Analytics.track_calls.should == [
      { event: '...', properties: '...' }
    ]
  end
end
```

There's an additional helper for `track_events`. It provides an array of any `event` option that occurred during a track
request _(this only applies to `track`, and not `identify` or `alias`)_

```ruby
it "records 'User Viewed Company Page' as an event" do
  Analtics.track(event: 'User Viewed Company Page')
  Analytics.track_events.should == ['User Viewed Company Page']
end
```

You'll need to clear the collected data at the end of your tests. You can do that by calling `Analytics.clear`. We
keep that call in our `spec_helper`:

```ruby
config.after(:each) do
  Analytics.clear
end
```

_Future plans would be to move that into a session so that the `clear_counts` could be removed._

Debugging
----

If you'd like to see your calls output to console call the `debug` method:

```ruby
Analytics.debug
```

You'll get an output message any time a method on Analytics is called.

===

Proudly brought to you by [PetroFeed](http://PetroFeed.com). Pull requests and issues always welcome. :kissing_heart:


![Pedro](https://www.petrofeed.com/img/company/pedro.png)
