module RailsPdate
  module Formats
    module DateTime

      FORMATS = {
          :short        => '%e %b',
          :long         => '%B %e, %Y',
          :db           => '%Y-%m-%d',
          :number       => '%Y%m%d',
          :long_ordinal => lambda { |date|
            day_format = ActiveSupport::Inflector.ordinalize(date.day)
            date.strftime("%B #{day_format}, %Y") # => "April 25th, 2007"
          },
          :rfc822       => '%e %b %Y',
          :iso8601      => lambda { |date| date.iso8601 },
          :default      => '%Y-%m-%d %h:%i'
      }

      def to_formatted_s
        strftime(RailsPdate::Formats::DateTime::FORMATS[:default])
      end
      alias_method :to_default_s, :to_s
      alias_method :to_s, :to_formatted_s
    end

    module Date

      FORMATS = {
          :short        => '%e %b',
          :long         => '%B %e, %Y',
          :db           => '%Y-%m-%d',
          :number       => '%Y%m%d',
          :long_ordinal => lambda { |date|
            day_format = ActiveSupport::Inflector.ordinalize(date.day)
            date.strftime("%B #{day_format}, %Y") # => "April 25th, 2007"
          },
          :rfc822       => '%e %b %Y',
          :iso8601      => lambda { |date| date.iso8601 },
          :default      => '%Y-%m-%d'
      }

      def to_formatted_s
        strftime(RailsPdate::Formats::Date::FORMATS[:default])
      end
      alias_method :to_default_s, :to_s
      alias_method :to_s, :to_formatted_s
    end
  end
end