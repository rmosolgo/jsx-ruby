require 'execjs'
require 'react/source'
require 'singleton'
module JSX
  class Transformer
    include Singleton

    JSX_SOURCE_PATH = React::Source.bundled_path_for('JSXTransformer.js')

    def initialize
      # If execjs uses therubyracer, there is no 'global'. Make sure
      # we have it so JSX script can work properly.
      contents = 'var global = global || this;' + File.read(JSX_SOURCE_PATH)
      @context = ExecJS.compile(contents)
    end

    def call(code, strip_types: false, harmony: false)
      result = @context.call('JSXTransformer.transform', code, stripTypes: strip_types, harmony: harmony)
      result['code']
    end
  end
end