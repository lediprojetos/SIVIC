require 'spec_helper'

describe "sivic_aulas/show" do
  before(:each) do
    @sivic_aula = assign(:sivic_aula, stub_model(SivicAula,
      :nome_aula => "Nome Aula",
      :user => nil,
      :sivic_igreja => nil,
      :sivic_tumamoduloprofessor => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Aula/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
