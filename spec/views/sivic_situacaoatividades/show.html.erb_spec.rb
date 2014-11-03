require 'spec_helper'

describe "sivic_situacaoatividades/show" do
  before(:each) do
    @sivic_situacaoatividade = assign(:sivic_situacaoatividade, stub_model(SivicSituacaoatividade,
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
  end
end
