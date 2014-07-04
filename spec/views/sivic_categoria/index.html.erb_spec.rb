require 'spec_helper'

describe "sivic_categoria/index" do
  before(:each) do
    assign(:sivic_categoria, [
      stub_model(SivicCategorium,
        :nome_categoria => "Nome Categoria",
        :tipo_categoria => 1,
        :user => nil,
        :sivic_igreja => nil
      ),
      stub_model(SivicCategorium,
        :nome_categoria => "Nome Categoria",
        :tipo_categoria => 1,
        :user => nil,
        :sivic_igreja => nil
      )
    ])
  end

  it "renders a list of sivic_categoria" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Categoria".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
