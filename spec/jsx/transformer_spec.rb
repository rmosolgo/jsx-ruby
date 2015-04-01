require 'spec_helper'

describe JSX::Transformer do
  let(:transformer) { JSX::Transformer.instance }
  describe '#call' do
    it 'applies the JSX transform' do
      result = transformer.call("<h1 className='greeting'>Hello {name}</h1>")
      expected_result = 'React.createElement("h1", {className: "greeting"}, "Hello ", name)'
      assert_equal(expected_result, result)
    end

    it 'removes types, if you ask it to' do
      result = transformer.call("var nameFunc = function(name: string):string { return name }", strip_types: true)
      expected_result = "var nameFunc = function(name ) { return name }"
      assert_equal(expected_result.gsub(/\s+/, ' '), result.gsub(/\s+/, ' '))
    end

    it 'converts ES6, if you ask it to' do
      result = transformer.call("var {a, b} = {a: 1, b: 2};", harmony: true)
      expected_result = "var $__0=   {a: 1, b: 2},a=$__0.a,b=$__0.b;"
      assert_equal(expected_result, result)
    end
  end
end