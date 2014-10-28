require 'spec_helper'

describe "sivic_categories/index" do
  before(:each) do
    assign(:sivic_categories, [
      stub_model(SivicCategory,
        :nome_categoria => "Nome Categoria",
        :tipo_categoria => 1,
        :sivic_igreja => nil,
        :user => nil
      ),
      stub_model(SivicCategory,
        :nome_categoria => "Nome Categoria",
        :tipo_categoria => 1,
        :sivic_igreja => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of sivic_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Categoria".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
