require 'spec_helper'

describe "sivic_celulas/index" do
  before(:each) do
    assign(:sivic_celulas, [
      stub_model(SivicCelula,
        :sivic_pessoa => nil,
        :sivic_endereco => nil,
        :NUMR_Dia => 1
      ),
      stub_model(SivicCelula,
        :sivic_pessoa => nil,
        :sivic_endereco => nil,
        :NUMR_Dia => 1
      )
    ])
  end

  it "renders a list of sivic_celulas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
