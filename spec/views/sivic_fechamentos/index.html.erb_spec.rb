require 'spec_helper'

describe "sivic_fechamentos/index" do
  before(:each) do
    assign(:sivic_fechamentos, [
      stub_model(SivicFechamento,
        :sivic_igreja => nil,
        :desc_fechamento => "Desc Fechamento",
        :valr_fechamento => "9.99",
        :tipo_fechamento => 1,
        :User => nil
      ),
      stub_model(SivicFechamento,
        :sivic_igreja => nil,
        :desc_fechamento => "Desc Fechamento",
        :valr_fechamento => "9.99",
        :tipo_fechamento => 1,
        :User => nil
      )
    ])
  end

  it "renders a list of sivic_fechamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Fechamento".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
