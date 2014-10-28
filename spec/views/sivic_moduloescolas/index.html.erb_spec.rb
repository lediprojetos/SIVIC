require 'spec_helper'

describe "sivic_moduloescolas/index" do
  before(:each) do
    assign(:sivic_moduloescolas, [
      stub_model(SivicModuloescola,
        :sivic_igreja => nil,
        :user => nil,
        :nome_modulo => "Nome Modulo"
      ),
      stub_model(SivicModuloescola,
        :sivic_igreja => nil,
        :user => nil,
        :nome_modulo => "Nome Modulo"
      )
    ])
  end

  it "renders a list of sivic_moduloescolas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome Modulo".to_s, :count => 2
  end
end
