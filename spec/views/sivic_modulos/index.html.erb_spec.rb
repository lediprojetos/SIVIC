require 'spec_helper'

describe "sivic_modulos/index" do
  before(:each) do
    assign(:sivic_modulos, [
      stub_model(SivicModulo,
        :nome_modulo => "Nome Modulo",
        :desc_modulo => "Desc Modulo"
      ),
      stub_model(SivicModulo,
        :nome_modulo => "Nome Modulo",
        :desc_modulo => "Desc Modulo"
      )
    ])
  end

  it "renders a list of sivic_modulos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Modulo".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Modulo".to_s, :count => 2
  end
end
