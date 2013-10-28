require 'analytics_ruby_mock'

Analytics = AnalyticsRuby

describe AnalyticsRuby do
  after :each do
    Analytics.clear
  end

  context "clear" do
    it "removes any persisted data" do
      Analytics.track(event: 'tracked')
      Analytics.clear
      Analytics.track_calls.should == []
    end
  end

  context "track" do
    before :each do
      Analytics.track(event: 'tracked')
    end

    it "uses an array to track events" do
      Analytics.track_calls.should == [ {event: 'tracked' } ]
    end

    it "returns count for tracked events" do
      Analytics.track_count.should == 1
    end
  end

  context "identify" do
    before :each do
      Analytics.identify(event: 'identify')
    end

    it "uses an array to save events" do
      Analytics.identify_calls.should == [ {event: 'identify' } ]
    end

    it "returns count for saved events" do
      Analytics.identify_count.should == 1
    end
  end

  context "alias" do
    before :each do
      Analytics.alias(event: 'alias')
    end

    it "uses an array to save events" do
      Analytics.alias_calls.should == [ {event: 'alias' } ]
    end

    it "returns count for saved events" do
      Analytics.alias_count.should == 1
    end
  end
end
