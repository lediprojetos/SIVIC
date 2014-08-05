require 'spec_helper'

describe "sivic_cursos/edit" do
  before(:each) do
    @sivic_curso = assign(:sivic_curso, stub_model(SivicCurso,
      :nome_curso => "MyString",
      :desc_curso => "MyText",
      :sivic_igreja => nil,
      :user => nil
    ))
  end

  it "renders the edit sivic_curso form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_curso_path(@sivic_curso), "post" do
      assert_select "input#sivic_curso_nome_curso[name=?]", "sivic_curso[nome_curso]"
      assert_select "textarea#sivic_curso_desc_curso[name=?]", "sivic_curso[desc_curso]"
      assert_select "input#sivic_curso_sivic_igreja[name=?]", "sivic_curso[sivic_igreja]"
      assert_select "input#sivic_curso_user[name=?]", "sivic_curso[user]"
    end
  end
end
