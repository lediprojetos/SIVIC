require 'spec_helper'

describe "sivic_cursos/index" do
  before(:each) do
    assign(:sivic_cursos, [
      stub_model(SivicCurso,
        :nome_curso => "Nome Curso",
        :desc_curso => "MyText",
        :sivic_igreja => nil,
        :user => nil
      ),
      stub_model(SivicCurso,
        :nome_curso => "Nome Curso",
        :desc_curso => "MyText",
        :sivic_igreja => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of sivic_cursos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Curso".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
