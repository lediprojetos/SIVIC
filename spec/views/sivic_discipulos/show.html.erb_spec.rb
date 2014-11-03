require 'spec_helper'

describe "sivic_discipulos/show" do
  before(:each) do
    @sivic_discipulo = assign(:sivic_discipulo, stub_model(SivicDiscipulo,
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
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Desc Sexo/)
    rendered.should match(/Desc Apelido/)
    rendered.should match(/Desc Estado Civil/)
    rendered.should match(/Nome Conjuge/)
    rendered.should match(/4/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Desc Momento Estudo Biblico/)
    rendered.should match(/Numr Rg/)
    rendered.should match(//)
    rendered.should match(/Nome Pai/)
    rendered.should match(/Nome Mae/)
    rendered.should match(/Numr Titulo Eleitoral/)
    rendered.should match(/Desc Igreja Batismo/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
