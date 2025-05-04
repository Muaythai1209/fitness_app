# Utils::Converter

module Utils
  module Converter
    class << self
      def convert_to_boolean(value)
        ActiveModel::Type::Boolean.new.cast(value)
      end
    end
  end
end
