require 'spec_helper'

describe "sivic_categories/show" do
  before(:each) do
    @sivic_category = assign(:sivic_category, stub_model(SivicCategory,
      :nome_categoria => "Nome Categoria",
      :tipo_categoria => 1,
      :sivic_igreja => nil,
      :user => nil
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
