require 'spec_helper'

describe "sivic_atividadepessoas/show" do
  before(:each) do
    @sivic_atividadepessoa = assign(:sivic_atividadepessoa, stub_model(SivicAtividadepessoa,
      :flag_ativo => "",
      :sivic_atividade => nil,
      :sivic_igreja => nil,
      :sivic_pessoa => nil,
      :User => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
