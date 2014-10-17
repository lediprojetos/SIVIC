require 'spec_helper'

describe "sivic_atividades/show" do
  before(:each) do
    @sivic_atividade = assign(:sivic_atividade, stub_model(SivicAtividade,
      :nome_atividade => "Nome Atividade",
      :desc_atividade => "Desc Atividade",
      :sivic_periodicidadeconso => nil,
      :sivic_igreja => nil,
      :User => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Atividade/)
    rendered.should match(/Desc Atividade/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
