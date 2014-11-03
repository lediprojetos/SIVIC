require 'spec_helper'

describe "sivic_profissaos/show" do
  before(:each) do
    @sivic_profissao = assign(:sivic_profissao, stub_model(SivicProfissao,
      :profissao => "Profissao"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Profissao/)
  end
end
