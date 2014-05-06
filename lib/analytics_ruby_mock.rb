module AnalyticsRuby
  module ClassMethods
    attr_accessor :track_calls, :identify_calls, :alias_calls

    #############################################################
    # Track #####################################################

    def track(options)
      debug_message(:track, options)

      initialize if @track_calls.nil?
      @track_calls << options
    end

    def tracked_events
      (@track_calls || []).collect { |t| t[:event] || t['event'] }
    end

    #############################################################
    # Identify ##################################################

    def identify(options)
      debug_message(:identify, options)

      initialize if @identify_calls.nil?
      @identify_calls << options
    end

    #############################################################
    # Alias #####################################################

    def alias(options)
      debug_message(:alias, options)

      initialize if @alias_calls.nil?
      @alias_calls << options
    end

    #############################################################
    # Flush #####################################################

    def flush
      debug_message(:flush)
    end

    #############################################################
    # Mock Interface ############################################

    def debug
      @debug = true
    end

    def clear
      initialize
    end

    def last_event
      tracked_events.last
    end

    def last_call
      @track_calls.last
    end

    private

    def initialize
      @track_calls = []
      @identify_calls = []
      @alias_calls = []
    end

    def debug_message(method, options = nil)
      if @debug
        puts "Mock of AnalyticsRuby called #{method.to_s} #{options.present? ? "with: #{options}" : ""}"
      end
    end
  end
  extend ClassMethods
end
