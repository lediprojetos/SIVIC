require 'spec_helper'

describe "sivic_cursos/show" do
  before(:each) do
    @sivic_curso = assign(:sivic_curso, stub_model(SivicCurso,
      :nome_curso => "Nome Curso",
      :desc_curso => "MyText",
      :sivic_igreja => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Curso/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
