require 'spec_helper'

describe "sivic_moduloturmas/index" do
  before(:each) do
    assign(:sivic_moduloturmas, [
      stub_model(SivicModuloturma,
        :sivic_moduloescola => nil,
        :sivic_turma => nil
      ),
      stub_model(SivicModuloturma,
        :sivic_moduloescola => nil,
        :sivic_turma => nil
      )
    ])
  end

  it "renders a list of sivic_moduloturmas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
