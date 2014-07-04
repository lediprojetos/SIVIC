require 'spec_helper'

describe "sivic_categoria/show" do
  before(:each) do
    @sivic_categorium = assign(:sivic_categorium, stub_model(SivicCategorium,
      :nome_categoria => "Nome Categoria",
      :tipo_categoria => 1,
      :user => nil,
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Categoria/)
    rendered.should match(/1/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
