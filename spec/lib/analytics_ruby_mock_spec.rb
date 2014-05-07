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
      Analytics.track(event: 'tracked', property: 'prop')
    end

    it "uses an array to save all calls with full options" do
      Analytics.track_calls.should == [{event: 'tracked', property: 'prop'}]
    end

    it "returns an array of events only" do
      Analytics.tracked_events.should == ['tracked']
    end

    context "given multiple trackes" do
      before :each do
	Analytics.track(event: 'tracked1', property: 'pop1')
      end

      it "saves all calls with full options" do
	Analytics.track_calls.should == [
	  { event: 'tracked', property: 'prop'},
	  { event: 'tracked1', property: 'pop1' }
	]
      end

      it "saves all events" do
	Analytics.tracked_events.should == ['tracked', 'tracked1']
      end

      it "returns only the last event" do
	Analytics.last_event.should == 'tracked1'
      end

      it "returns only the last call" do
	Analytics.last_call.should == { event: 'tracked1', property: 'pop1' }
      end
    end
  end


  context "tracked_events" do
    it "does not throw an exception if track has not been called" do
      expect {
        Analytics.tracked_events
      }.to_not raise_error
    end
  end

  context "identify" do
    before :each do
      Analytics.identify(event: 'identify', property: 'prop')
    end

    it "uses an array to save all calls with full options" do
      Analytics.identify_calls.should == [{event: 'identify', property: 'prop'}]
    end
  end

  context "alias" do
    before :each do
      Analytics.alias(event: 'alias', property: 'prop')
    end

    it "uses an array to save events" do
      Analytics.alias_calls.should == [{event: 'alias', property: 'prop'}]
    end
  end
end
