require 'spec_helper'

describe "sivic_licaos/show" do
  before(:each) do
    @sivic_licao = assign(:sivic_licao, stub_model(SivicLicao,
      :nome_licao => "Nome Licao",
      :user => nil,
      :sivic_igreja => nil,
      :sivic_turmamoduloprofessor => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Licao/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
