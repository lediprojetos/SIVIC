require 'spec_helper'

describe "sivic_professors/edit" do
  before(:each) do
    @sivic_professor = assign(:sivic_professor, stub_model(SivicProfessor,
      :sivic_pessoa => nil,
      :user => nil,
      :user => nil
    ))
  end

  it "renders the edit sivic_professor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_professor_path(@sivic_professor), "post" do
      assert_select "input#sivic_professor_sivic_pessoa[name=?]", "sivic_professor[sivic_pessoa]"
      assert_select "input#sivic_professor_user[name=?]", "sivic_professor[user]"
      assert_select "input#sivic_professor_user[name=?]", "sivic_professor[user]"
    end
  end
end
