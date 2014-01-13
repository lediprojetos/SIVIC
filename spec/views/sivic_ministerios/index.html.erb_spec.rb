require 'spec_helper'

describe "sivic_ministerios/index" do
  before(:each) do
    assign(:sivic_ministerios, [
      stub_model(SivicMinisterio,
        :nome_ministerio => "Nome Ministerio",
        :sigl_ministerio => "Sigl Ministerio",
        :sivic_igreja => nil
      ),
      stub_model(SivicMinisterio,
        :nome_ministerio => "Nome Ministerio",
        :sigl_ministerio => "Sigl Ministerio",
        :sivic_igreja => nil
      )
    ])
  end

  it "renders a list of sivic_ministerios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Ministerio".to_s, :count => 2
    assert_select "tr>td", :text => "Sigl Ministerio".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
