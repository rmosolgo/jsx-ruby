require 'jsx/template'
require 'jsx/transformer'
require 'jsx/version'

module JSX
  def self.transform(*args)
    Transformer.instance.call(*args)
  end
end

