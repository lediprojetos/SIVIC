require 'spec_helper'

describe "sivic_discipulos/index" do
  before(:each) do
    assign(:sivic_discipulos, [
      stub_model(SivicDiscipulo,
        :sivic_pessoa => nil,
        :sivic_endereco => nil,
        :sivic_profissao => nil,
        :sivic_escolaridade => nil,
        :sivic_rede => nil,
        :sivic_celula => nil,
        :NUMG_ProfissaoConjuge => 1,
        :NUMG_UsuarioInclusao => 2,
        :NUMG_UsuarioBloqueio => 3,
        :DESC_Sexo => "Desc Sexo",
        :DESC_Apelido => "Desc Apelido",
        :DESC_EstadoCivil => "Desc Estado Civil",
        :NOME_Conjuge => "Nome Conjuge",
        :NUMR_QtdFilhos => 4,
        :FLAG_Membro => false,
        :FLAG_RecebeuCristo => false,
        :FLAG_Reconciliacao => false,
        :FLAG_OcasiaoCelula => false,
        :FLAG_OcasiaoCelebracaoEvento => false,
        :FLAG_OcasiaoEvangelismoPessoal => false,
        :FLAG_OcasiaoCultoLivre => false,
        :FLAG_Trabalhando => false,
        :DESC_MomentoEstudoBiblico => "Desc Momento Estudo Biblico",
        :NUMR_RG => "Numr Rg",
        :NUMR_CPF => "",
        :NOME_Pai => "Nome Pai",
        :NOME_Mae => "Nome Mae",
        :NUMR_TituloEleitoral => "Numr Titulo Eleitoral",
        :DESC_IgrejaBatismo => "Desc Igreja Batismo",
        :FLAG_DoadorSangue => false,
        :FLAG_DoadorOrgao => false
      ),
      stub_model(SivicDiscipulo,
        :sivic_pessoa => nil,
        :sivic_endereco => nil,
        :sivic_profissao => nil,
        :sivic_escolaridade => nil,
        :sivic_rede => nil,
        :sivic_celula => nil,
        :NUMG_ProfissaoConjuge => 1,
        :NUMG_UsuarioInclusao => 2,
        :NUMG_UsuarioBloqueio => 3,
        :DESC_Sexo => "Desc Sexo",
        :DESC_Apelido => "Desc Apelido",
        :DESC_EstadoCivil => "Desc Estado Civil",
        :NOME_Conjuge => "Nome Conjuge",
        :NUMR_QtdFilhos => 4,
        :FLAG_Membro => false,
        :FLAG_RecebeuCristo => false,
        :FLAG_Reconciliacao => false,
        :FLAG_OcasiaoCelula => false,
        :FLAG_OcasiaoCelebracaoEvento => false,
        :FLAG_OcasiaoEvangelismoPessoal => false,
        :FLAG_OcasiaoCultoLivre => false,
        :FLAG_Trabalhando => false,
        :DESC_MomentoEstudoBiblico => "Desc Momento Estudo Biblico",
        :NUMR_RG => "Numr Rg",
        :NUMR_CPF => "",
        :NOME_Pai => "Nome Pai",
        :NOME_Mae => "Nome Mae",
        :NUMR_TituloEleitoral => "Numr Titulo Eleitoral",
        :DESC_IgrejaBatismo => "Desc Igreja Batismo",
        :FLAG_DoadorSangue => false,
        :FLAG_DoadorOrgao => false
      )
    ])
  end

  it "renders a list of sivic_discipulos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Sexo".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Apelido".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Estado Civil".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Conjuge".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Momento Estudo Biblico".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Rg".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Pai".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Mae".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Titulo Eleitoral".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Igreja Batismo".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
