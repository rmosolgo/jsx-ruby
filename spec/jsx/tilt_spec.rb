require 'spec_helper'

describe 'jsx/tilt' do
  let(:template_path) { File.expand_path("../../fixtures/hello_tilt.jsx", __FILE__) }

  before do
    Tilt.mappings.delete('jsx')
  end

  it 'registers JSX::Template with .jsx' do
    assert_raises(RuntimeError) { Tilt.new(template_path) }
    # use load to force reloading. Usually `require` is fine
    load('jsx/tilt.rb')
    template = Tilt.new(template_path)
    assert_match("React.createElement", template.render)
  end
end