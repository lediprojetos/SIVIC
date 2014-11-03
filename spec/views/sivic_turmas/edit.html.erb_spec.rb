require 'spec_helper'

describe "sivic_turmas/edit" do
  before(:each) do
    @sivic_turma = assign(:sivic_turma, stub_model(SivicTurma,
      :sivic_igreja => nil,
      :user => nil,
      :user => nil,
      :DESC_turma => "MyString",
      :NUMR_QdtVagas => 1
    ))
  end

  it "renders the edit sivic_turma form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_turma_path(@sivic_turma), "post" do
      assert_select "input#sivic_turma_sivic_igreja[name=?]", "sivic_turma[sivic_igreja]"
      assert_select "input#sivic_turma_user[name=?]", "sivic_turma[user]"
      assert_select "input#sivic_turma_user[name=?]", "sivic_turma[user]"
      assert_select "input#sivic_turma_DESC_turma[name=?]", "sivic_turma[DESC_turma]"
      assert_select "input#sivic_turma_NUMR_QdtVagas[name=?]", "sivic_turma[NUMR_QdtVagas]"
    end
  end
end
