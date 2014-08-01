require 'spec_helper'

describe "sivic_turmaalunos/new" do
  before(:each) do
    assign(:sivic_turmaaluno, stub_model(SivicTurmaaluno,
      :sivic_turma => nil,
      :sivic_pessoa => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new sivic_turmaaluno form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_turmaalunos_path, "post" do
      assert_select "input#sivic_turmaaluno_sivic_turma[name=?]", "sivic_turmaaluno[sivic_turma]"
      assert_select "input#sivic_turmaaluno_sivic_pessoa[name=?]", "sivic_turmaaluno[sivic_pessoa]"
      assert_select "input#sivic_turmaaluno_user[name=?]", "sivic_turmaaluno[user]"
    end
  end
end
