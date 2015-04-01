require 'spec_helper'

describe JSX::Template do
  let(:template_path) { File.expand_path("../../fixtures/hello_tilt.jsx", __FILE__) }
  let(:template)  { Tilt.new(template_path) }

  before do
    Tilt.register(JSX::Template, "jsx")
    JSX::Template.transform_options = {harmony: true}
  end

  it 'uses transform_options' do
    assert_match(%{render:function()}, template.render)
  end

  it 'converts JSX' do
    assert_match(%{React.createElement("h1", null, "Hello Tilt!")}, template.render)
  end
end