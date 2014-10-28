json.array!(@sivic_discipulos) do |sivic_discipulo|
  json.extract! sivic_discipulo, :sivic_pessoa_id, :sivic_endereco_id, :sivic_profissao_id, :sivic_escolaridade_id, :sivic_rede_id, :sivic_celula_id, :NUMG_ProfissaoConjuge, :NUMG_UsuarioInclusao, :NUMG_UsuarioBloqueio, :desc_sexo, :DATA_Nascimento, :DESC_Apelido, :desc_estadocivil, :NOME_Conjuge, :DATA_Decisao, :NUMR_QtdFilhos, :FLAG_Membro, :FLAG_RecebeuCristo, :FLAG_Reconciliacao, :FLAG_OcasiaoCelula, :FLAG_OcasiaoCelebracaoEvento, :FLAG_OcasiaoEvangelismoPessoal, :FLAG_OcasiaoCultoLivre, :FLAG_Trabalhando, :DESC_MomentoEstudoBiblico, :NUMR_RG, :DATA_EmissaoRG, :NUMR_CPF, :NOME_Pai, :NOME_Mae, :DATA_NascConjuge, :DATA_Casamento, :NUMR_TituloEleitoral, :DATA_Batismo, :DESC_IgrejaBatismo, :FLAG_DoadorSangue, :FLAG_DoadorOrgao
  json.url sivic_discipulo_url(sivic_discipulo, format: :json)
end