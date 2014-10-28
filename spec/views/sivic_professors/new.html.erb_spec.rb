require 'spec_helper'

describe "sivic_professors/new" do
  before(:each) do
    assign(:sivic_professor, stub_model(SivicProfessor,
      :sivic_pessoa => nil,
      :user => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new sivic_professor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_professors_path, "post" do
      assert_select "input#sivic_professor_sivic_pessoa[name=?]", "sivic_professor[sivic_pessoa]"
      assert_select "input#sivic_professor_user[name=?]", "sivic_professor[user]"
      assert_select "input#sivic_professor_user[name=?]", "sivic_professor[user]"
    end
  end
end
