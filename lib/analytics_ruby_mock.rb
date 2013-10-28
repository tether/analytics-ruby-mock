module AnalyticsRuby
  module ClassMethods
    attr_accessor :track_calls, :identify_calls, :alias_calls

    def track(options)
      debug_message(:track, options)

      initialize if @track_calls.nil?
      @track_calls << options
    end

    def track_count
      initialize if @track_calls.nil?
      @track_calls.count
    end

    def identify(options)
      debug_message(:identify, options)

      initialize if @identify_calls.nil?
      @identify_calls << options
    end

    def identify_count
      initialize if @identify_calls.nil?
      @identify_calls.count
    end

    def alias(options)
      debug_message(:alias, options)

      initialize if @alias_calls.nil?
      @alias_calls << options
    end

    def alias_count
      initialize if @alias_calls.nil?
      @alias_calls.count
    end

    def flush
      debug_message(:flush)
    end

    def debug
      @debug = true
    end

    def clear
      initialize
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
