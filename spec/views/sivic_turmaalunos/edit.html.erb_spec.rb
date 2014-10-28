require 'spec_helper'

describe "sivic_turmaalunos/edit" do
  before(:each) do
    @sivic_turmaaluno = assign(:sivic_turmaaluno, stub_model(SivicTurmaaluno,
      :sivic_turma => nil,
      :sivic_pessoa => nil,
      :user => nil
    ))
  end

  it "renders the edit sivic_turmaaluno form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_turmaaluno_path(@sivic_turmaaluno), "post" do
      assert_select "input#sivic_turmaaluno_sivic_turma[name=?]", "sivic_turmaaluno[sivic_turma]"
      assert_select "input#sivic_turmaaluno_sivic_pessoa[name=?]", "sivic_turmaaluno[sivic_pessoa]"
      assert_select "input#sivic_turmaaluno_user[name=?]", "sivic_turmaaluno[user]"
    end
  end
end
