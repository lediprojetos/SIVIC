require 'spec_helper'

describe "sivic_enderecos/show" do
  before(:each) do
    @sivic_endereco = assign(:sivic_endereco, stub_model(SivicEndereco,
      :DESC_Bairro => "Desc Bairro",
      :DESC_Rua => "Desc Rua",
      :DESC_Complemento => "Desc Complemento",
      :DESC_Pontoreferencia => "Desc Pontoreferencia",
      :NUMR_Cep => 1,
      :sivic_cidade => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc Bairro/)
    rendered.should match(/Desc Rua/)
    rendered.should match(/Desc Complemento/)
    rendered.should match(/Desc Pontoreferencia/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
