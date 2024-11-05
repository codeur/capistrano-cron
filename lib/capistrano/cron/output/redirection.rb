class Capistrano::Cron
  module Output
    class Redirection
      def initialize(output)
        @output = output
      end

      def to_s
        return "" unless defined?(@output)
        case @output
        when String then redirect_from_string
        when Hash then redirect_from_hash
        when NilClass then ">> /dev/null 2>&1"
        when Proc then @output.call
        else ""
        end
      end

      protected

      def stdout
        return unless @output.has_key?(:standard)
        @output[:standard].nil? ? "/dev/null" : @output[:standard]
      end

      def stderr
        return unless @output.has_key?(:error)
        @output[:error].nil? ? "/dev/null" : @output[:error]
      end

      def redirect_from_hash
        if stdout == "/dev/null" && stderr == "/dev/null"
          "> /dev/null 2>&1"
        elsif stdout && stderr == "/dev/null"
          ">> #{stdout} 2> /dev/null"
        elsif stdout && stderr
          ">> #{stdout} 2>> #{stderr}"
        elsif stderr == "/dev/null"
          "2> /dev/null"
        elsif stderr
          "2>> #{stderr}"
        elsif stdout == "/dev/null"
          "> /dev/null"
        elsif stdout
          ">> #{stdout}"
        else
          ""
        end
      end

      def redirect_from_string
        ">> #{@output} 2>&1"
      end
    end
  end
end
