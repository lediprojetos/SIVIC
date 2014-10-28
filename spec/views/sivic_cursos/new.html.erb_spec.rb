require 'spec_helper'

describe "sivic_cursos/new" do
  before(:each) do
    assign(:sivic_curso, stub_model(SivicCurso,
      :nome_curso => "MyString",
      :desc_curso => "MyText",
      :sivic_igreja => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new sivic_curso form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_cursos_path, "post" do
      assert_select "input#sivic_curso_nome_curso[name=?]", "sivic_curso[nome_curso]"
      assert_select "textarea#sivic_curso_desc_curso[name=?]", "sivic_curso[desc_curso]"
      assert_select "input#sivic_curso_sivic_igreja[name=?]", "sivic_curso[sivic_igreja]"
      assert_select "input#sivic_curso_user[name=?]", "sivic_curso[user]"
    end
  end
end
