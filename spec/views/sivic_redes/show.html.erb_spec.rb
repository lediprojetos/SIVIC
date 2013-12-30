require 'spec_helper'

describe "sivic_redes/show" do
  before(:each) do
    @sivic_rede = assign(:sivic_rede, stub_model(SivicRede,
      :nome_rede => "Nome Rede",
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Rede/)
    rendered.should match(//)
  end
end
