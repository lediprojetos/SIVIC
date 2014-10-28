require 'spec_helper'

describe "sivic_contabancos/show" do
  before(:each) do
    @sivic_contabanco = assign(:sivic_contabanco, stub_model(SivicContabanco,
      :nome_conta => "Nome Conta",
      :numr_agencia => "Numr Agencia",
      :numr_conta => "Numr Conta",
      :numr_dvconta => "Numr Dvconta",
      :sivic_banco => nil,
      :sivic_igreja => nil,
      :User => "",
      :User => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Conta/)
    rendered.should match(/Numr Agencia/)
    rendered.should match(/Numr Conta/)
    rendered.should match(/Numr Dvconta/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
