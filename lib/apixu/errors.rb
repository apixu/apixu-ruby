module Apixu::Errors
  class InvalidKey < StandardError; end

  class Request < StandardError
    def initialize(code, message)
      super "#{code}: #{message}"
    end
  end
end
