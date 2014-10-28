require 'spec_helper'

describe "sivic_turmas/new" do
  before(:each) do
    assign(:sivic_turma, stub_model(SivicTurma,
      :sivic_igreja => nil,
      :user => nil,
      :user => nil,
      :DESC_turma => "MyString",
      :NUMR_QdtVagas => 1
    ).as_new_record)
  end

  it "renders new sivic_turma form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_turmas_path, "post" do
      assert_select "input#sivic_turma_sivic_igreja[name=?]", "sivic_turma[sivic_igreja]"
      assert_select "input#sivic_turma_user[name=?]", "sivic_turma[user]"
      assert_select "input#sivic_turma_user[name=?]", "sivic_turma[user]"
      assert_select "input#sivic_turma_DESC_turma[name=?]", "sivic_turma[DESC_turma]"
      assert_select "input#sivic_turma_NUMR_QdtVagas[name=?]", "sivic_turma[NUMR_QdtVagas]"
    end
  end
end
