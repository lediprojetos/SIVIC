require 'spec_helper'

describe "sivic_models/index" do
  before(:each) do
    assign(:sivic_models, [
      stub_model(SivicModel,
        :nome_model => "Nome Model",
        :desc_model => "Desc Model"
      ),
      stub_model(SivicModel,
        :nome_model => "Nome Model",
        :desc_model => "Desc Model"
      )
    ])
  end

  it "renders a list of sivic_models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Model".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Model".to_s, :count => 2
  end
end
