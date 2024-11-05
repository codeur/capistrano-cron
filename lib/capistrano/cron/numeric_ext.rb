class Capistrano::Cron
  class NumericSeconds
    attr_reader :number

    def self.seconds(number, units)
      new(number).send(units)
    end

    def initialize(number)
      @number = number.to_i
    end

    def seconds
      number
    end
    alias_method :second, :seconds

    def minutes
      number * 60
    end
    alias_method :minute, :minutes

    def hours
      number * 3_600
    end
    alias_method :hour, :hours

    def days
      number * 86_400
    end
    alias_method :day, :days

    def weeks
      number * 604_800
    end
    alias_method :week, :weeks

    def months
      number * 2_592_000
    end
    alias_method :month, :months

    def years
      number * 31_557_600
    end
    alias_method :year, :years
  end
end

Numeric.class_eval do
  def respond_to?(method, include_private = false)
    super || Capistrano::Cron::NumericSeconds.public_method_defined?(method)
  end

  def method_missing(method, *args, &block)
    if Capistrano::Cron::NumericSeconds.public_method_defined?(method)
      Capistrano::Cron::NumericSeconds.new(self).send(method)
    else
      super
    end
  end
end
