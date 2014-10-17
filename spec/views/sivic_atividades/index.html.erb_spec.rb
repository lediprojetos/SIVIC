require 'spec_helper'

describe "sivic_atividades/index" do
  before(:each) do
    assign(:sivic_atividades, [
      stub_model(SivicAtividade,
        :nome_atividade => "Nome Atividade",
        :desc_atividade => "Desc Atividade",
        :sivic_periodicidadeconso => nil,
        :sivic_igreja => nil,
        :User => nil
      ),
      stub_model(SivicAtividade,
        :nome_atividade => "Nome Atividade",
        :desc_atividade => "Desc Atividade",
        :sivic_periodicidadeconso => nil,
        :sivic_igreja => nil,
        :User => nil
      )
    ])
  end

  it "renders a list of sivic_atividades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Atividade".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Atividade".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
