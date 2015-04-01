require 'tilt'

module JSX
  class Template < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      @output ||= JSX.transform(data, self.class.transform_options || {})
    end


    class << self
      attr_accessor :transform_options
    end
  end
end