require 'spec_helper'

describe "sivic_models/new" do
  before(:each) do
    assign(:sivic_model, stub_model(SivicModel,
      :nome_model => "MyString",
      :desc_model => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_models_path, "post" do
      assert_select "input#sivic_model_nome_model[name=?]", "sivic_model[nome_model]"
      assert_select "input#sivic_model_desc_model[name=?]", "sivic_model[desc_model]"
    end
  end
end
