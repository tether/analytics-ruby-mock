module AnalyticsRuby
  module ClassMethods
    def track(options)
      debug_message(:track, options)
    end

    def identify(options)
      debug_message(:identify, options)
    end

    def alias(options)
      debug_message(:alias, options)
    end

    def flush
      debug_message(:flush)
    end

    def debug
      @debug = true
    end

    private

    def debug_message(method, options = nil)
      if @debug
        puts "Mock of AnalyticsRuby called #{method.to_s} #{options.present? ? "with: #{options}" : ""}"
      end
    end
  end
  extend ClassMethods
end
