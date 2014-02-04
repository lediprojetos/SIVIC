require 'spec_helper'

describe "sivic_discipulos/edit" do
  before(:each) do
    @sivic_discipulo = assign(:sivic_discipulo, stub_model(SivicDiscipulo,
      :sivic_pessoa => nil,
      :sivic_endereco => nil,
      :sivic_profissao => nil,
      :sivic_escolaridade => nil,
      :sivic_rede => nil,
      :sivic_celula => nil,
      :NUMG_ProfissaoConjuge => 1,
      :NUMG_UsuarioInclusao => 1,
      :NUMG_UsuarioBloqueio => 1,
      :DESC_Sexo => "MyString",
      :DESC_Apelido => "MyString",
      :DESC_EstadoCivil => "MyString",
      :NOME_Conjuge => "MyString",
      :NUMR_QtdFilhos => 1,
      :FLAG_Membro => false,
      :FLAG_RecebeuCristo => false,
      :FLAG_Reconciliacao => false,
      :FLAG_OcasiaoCelula => false,
      :FLAG_OcasiaoCelebracaoEvento => false,
      :FLAG_OcasiaoEvangelismoPessoal => false,
      :FLAG_OcasiaoCultoLivre => false,
      :FLAG_Trabalhando => false,
      :DESC_MomentoEstudoBiblico => "MyString",
      :NUMR_RG => "MyString",
      :NUMR_CPF => "",
      :NOME_Pai => "MyString",
      :NOME_Mae => "MyString",
      :NUMR_TituloEleitoral => "MyString",
      :DESC_IgrejaBatismo => "MyString",
      :FLAG_DoadorSangue => false,
      :FLAG_DoadorOrgao => false
    ))
  end

  it "renders the edit sivic_discipulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_discipulo_path(@sivic_discipulo), "post" do
      assert_select "input#sivic_discipulo_sivic_pessoa[name=?]", "sivic_discipulo[sivic_pessoa]"
      assert_select "input#sivic_discipulo_sivic_endereco[name=?]", "sivic_discipulo[sivic_endereco]"
      assert_select "input#sivic_discipulo_sivic_profissao[name=?]", "sivic_discipulo[sivic_profissao]"
      assert_select "input#sivic_discipulo_sivic_escolaridade[name=?]", "sivic_discipulo[sivic_escolaridade]"
      assert_select "input#sivic_discipulo_sivic_rede[name=?]", "sivic_discipulo[sivic_rede]"
      assert_select "input#sivic_discipulo_sivic_celula[name=?]", "sivic_discipulo[sivic_celula]"
      assert_select "input#sivic_discipulo_NUMG_ProfissaoConjuge[name=?]", "sivic_discipulo[NUMG_ProfissaoConjuge]"
      assert_select "input#sivic_discipulo_NUMG_UsuarioInclusao[name=?]", "sivic_discipulo[NUMG_UsuarioInclusao]"
      assert_select "input#sivic_discipulo_NUMG_UsuarioBloqueio[name=?]", "sivic_discipulo[NUMG_UsuarioBloqueio]"
      assert_select "input#sivic_discipulo_DESC_Sexo[name=?]", "sivic_discipulo[DESC_Sexo]"
      assert_select "input#sivic_discipulo_DESC_Apelido[name=?]", "sivic_discipulo[DESC_Apelido]"
      assert_select "input#sivic_discipulo_DESC_EstadoCivil[name=?]", "sivic_discipulo[DESC_EstadoCivil]"
      assert_select "input#sivic_discipulo_NOME_Conjuge[name=?]", "sivic_discipulo[NOME_Conjuge]"
      assert_select "input#sivic_discipulo_NUMR_QtdFilhos[name=?]", "sivic_discipulo[NUMR_QtdFilhos]"
      assert_select "input#sivic_discipulo_FLAG_Membro[name=?]", "sivic_discipulo[FLAG_Membro]"
      assert_select "input#sivic_discipulo_FLAG_RecebeuCristo[name=?]", "sivic_discipulo[FLAG_RecebeuCristo]"
      assert_select "input#sivic_discipulo_FLAG_Reconciliacao[name=?]", "sivic_discipulo[FLAG_Reconciliacao]"
      assert_select "input#sivic_discipulo_FLAG_OcasiaoCelula[name=?]", "sivic_discipulo[FLAG_OcasiaoCelula]"
      assert_select "input#sivic_discipulo_FLAG_OcasiaoCelebracaoEvento[name=?]", "sivic_discipulo[FLAG_OcasiaoCelebracaoEvento]"
      assert_select "input#sivic_discipulo_FLAG_OcasiaoEvangelismoPessoal[name=?]", "sivic_discipulo[FLAG_OcasiaoEvangelismoPessoal]"
      assert_select "input#sivic_discipulo_FLAG_OcasiaoCultoLivre[name=?]", "sivic_discipulo[FLAG_OcasiaoCultoLivre]"
      assert_select "input#sivic_discipulo_FLAG_Trabalhando[name=?]", "sivic_discipulo[FLAG_Trabalhando]"
      assert_select "input#sivic_discipulo_DESC_MomentoEstudoBiblico[name=?]", "sivic_discipulo[DESC_MomentoEstudoBiblico]"
      assert_select "input#sivic_discipulo_NUMR_RG[name=?]", "sivic_discipulo[NUMR_RG]"
      assert_select "input#sivic_discipulo_NUMR_CPF[name=?]", "sivic_discipulo[NUMR_CPF]"
      assert_select "input#sivic_discipulo_NOME_Pai[name=?]", "sivic_discipulo[NOME_Pai]"
      assert_select "input#sivic_discipulo_NOME_Mae[name=?]", "sivic_discipulo[NOME_Mae]"
      assert_select "input#sivic_discipulo_NUMR_TituloEleitoral[name=?]", "sivic_discipulo[NUMR_TituloEleitoral]"
      assert_select "input#sivic_discipulo_DESC_IgrejaBatismo[name=?]", "sivic_discipulo[DESC_IgrejaBatismo]"
      assert_select "input#sivic_discipulo_FLAG_DoadorSangue[name=?]", "sivic_discipulo[FLAG_DoadorSangue]"
      assert_select "input#sivic_discipulo_FLAG_DoadorOrgao[name=?]", "sivic_discipulo[FLAG_DoadorOrgao]"
    end
  end
end
