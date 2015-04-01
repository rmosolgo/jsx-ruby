require 'spec_helper'

describe JSX do
  describe '.transform' do
    it 'Transforms JSX' do
      result = JSX.transform("<h1 className='greeting'>Hello {name}</h1>")
      expected_result = 'React.createElement("h1", {className: "greeting"}, "Hello ", name)'
      assert_equal(expected_result, result)
    end
  end
end