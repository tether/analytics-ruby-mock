module AnalyticsRuby
  module ClassMethods
    def track(options)
      debug_message(:track, options)

      initialize if @track_count.nil?
      @track_count = @track_count + 1
    end

    def track_count
      initialize if @track_count.nil?
      @track_count
    end

    def identify(options)
      debug_message(:identify, options)

      initialize if @identify_count.nil?
      @identify_count = @identify_count + 1
    end

    def identify_count
      initialize if @identify_count.nil?
      @identify_count
    end

    def alias(options)
      debug_message(:alias, options)

      initialize if @alias_count.nil?
      @alias_count = @alias_count + 1
    end

    def alias_count
      initialize if @alias_count.nil?
      @alias_count
    end

    def flush
      debug_message(:flush)
    end

    def debug
      @debug = true
    end

    def clear_counts
      initialize
    end

    private

    def initialize
      @track_count = 0
      @identify_count = 0
      @alias_count = 0
    end

    def debug_message(method, options = nil)
      if @debug
        puts "Mock of AnalyticsRuby called #{method.to_s} #{options.present? ? "with: #{options}" : ""}"
      end
    end
  end
  extend ClassMethods
end
