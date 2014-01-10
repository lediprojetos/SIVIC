require 'spec_helper'

describe "sivic_pessoas/index" do
  before(:each) do
    assign(:sivic_pessoas, [
      stub_model(SivicPessoa,
        :NOME_pessoa => "Nome Pessoa",
        :DESC_email => "Desc Email",
        :DESC_observacao => "Desc Observacao",
        :sivic_igreja => nil,
        :User => nil
      ),
      stub_model(SivicPessoa,
        :NOME_pessoa => "Nome Pessoa",
        :DESC_email => "Desc Email",
        :DESC_observacao => "Desc Observacao",
        :sivic_igreja => nil,
        :User => nil
      )
    ])
  end

  it "renders a list of sivic_pessoas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Pessoa".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Email".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Observacao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
