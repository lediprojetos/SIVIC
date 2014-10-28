require 'spec_helper'

describe "sivic_alunoaulas/new" do
  before(:each) do
    assign(:sivic_alunoaula, stub_model(SivicAlunoaula,
      :sivic_turmaaluno => nil,
      :sivic_aula => nil,
      :flag_ausente => 1
    ).as_new_record)
  end

  it "renders new sivic_alunoaula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_alunoaulas_path, "post" do
      assert_select "input#sivic_alunoaula_sivic_turmaaluno[name=?]", "sivic_alunoaula[sivic_turmaaluno]"
      assert_select "input#sivic_alunoaula_sivic_aula[name=?]", "sivic_alunoaula[sivic_aula]"
      assert_select "input#sivic_alunoaula_flag_ausente[name=?]", "sivic_alunoaula[flag_ausente]"
    end
  end
end
