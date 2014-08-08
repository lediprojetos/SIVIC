# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140806155821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "observacoesrelatorios", force: true do |t|
    t.integer  "sivic_relatorioscelula_id"
    t.integer  "sivic_pessoa_id"
    t.string   "DESC_Observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "observacoesrelatorios", ["sivic_pessoa_id"], name: "index_observacoesrelatorios_on_sivic_pessoa_id", using: :btree
  add_index "observacoesrelatorios", ["sivic_relatorioscelula_id"], name: "index_observacoesrelatorios_on_sivic_relatorioscelula_id", using: :btree

  create_table "sivic_bancos", force: true do |t|
    t.string   "nome_banco"
    t.integer  "numr_codigo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sivic_categories", force: true do |t|
    t.integer  "father_id"
    t.integer  "integer"
    t.string   "nome_categoria"
    t.integer  "tipo_categoria"
    t.integer  "sivic_igreja_id"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.datetime "DATA_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_categories", ["sivic_igreja_id"], name: "index_sivic_categories_on_sivic_igreja_id", using: :btree

  create_table "sivic_celulas", force: true do |t|
    t.string   "NOME_Celula"
    t.integer  "sivic_pessoa_id"
    t.integer  "sivic_endereco_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.string   "NUMR_Dia"
    t.string   "DESC_Bloqueio"
    t.integer  "user_bloqueio"
    t.datetime "DATA_Bloqueio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "DESC_sexo"
    t.boolean  "FLAG_crianca"
    t.boolean  "FLAG_jovem"
    t.boolean  "FLAG_adulto"
    t.integer  "NUMR_Codigo"
  end

  add_index "sivic_celulas", ["sivic_endereco_id"], name: "index_sivic_celulas_on_sivic_endereco_id", using: :btree
  add_index "sivic_celulas", ["sivic_pessoa_id"], name: "index_sivic_celulas_on_sivic_pessoa_id", using: :btree

  create_table "sivic_centrocustos", force: true do |t|
    t.string   "nome_centrocusto"
    t.text     "desc_centrocusto"
    t.integer  "user_id"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_centrocustos", ["sivic_igreja_id"], name: "index_sivic_centrocustos_on_sivic_igreja_id", using: :btree
  add_index "sivic_centrocustos", ["user_id"], name: "index_sivic_centrocustos_on_user_id", using: :btree

  create_table "sivic_cidades", force: true do |t|
    t.string   "nome_cidade"
    t.integer  "sivic_estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_cidades", ["sivic_estado_id"], name: "index_sivic_cidades_on_sivic_estado_id", using: :btree

  create_table "sivic_contabancos", force: true do |t|
    t.string   "nome_conta"
    t.string   "numr_agencia"
    t.string   "numr_conta"
    t.string   "numr_dvconta"
    t.integer  "sivic_banco_id"
    t.integer  "sivic_igreja_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.date     "data_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_contabancos", ["sivic_banco_id"], name: "index_sivic_contabancos_on_sivic_banco_id", using: :btree
  add_index "sivic_contabancos", ["sivic_igreja_id"], name: "index_sivic_contabancos_on_sivic_igreja_id", using: :btree

  create_table "sivic_contcelulas", force: true do |t|
    t.integer  "NUMR_Contador"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_contcelulas", ["sivic_igreja_id"], name: "index_sivic_contcelulas_on_sivic_igreja_id", using: :btree

  create_table "sivic_contdiscipulos", force: true do |t|
    t.integer  "NUMR_Contador"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_contdiscipulos", ["sivic_igreja_id"], name: "index_sivic_contdiscipulos_on_sivic_igreja_id", using: :btree

  create_table "sivic_cursos", force: true do |t|
    t.string   "nome_curso"
    t.text     "desc_curso"
    t.integer  "sivic_igreja_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_cursos", ["sivic_igreja_id"], name: "index_sivic_cursos_on_sivic_igreja_id", using: :btree

  create_table "sivic_discipulos", force: true do |t|
    t.integer  "sivic_pessoa_id"
    t.integer  "sivic_endereco_id"
    t.integer  "sivic_profissao_id"
    t.integer  "sivic_escolaridade_id"
    t.integer  "sivic_rede_id"
    t.integer  "sivic_celula_id"
    t.integer  "NUMG_ProfissaoConjuge"
    t.integer  "integer"
    t.integer  "NUMG_UsuarioInclusao"
    t.integer  "NUMG_UsuarioBloqueio"
    t.string   "DESC_Sexo"
    t.date     "DATA_Nascimento"
    t.string   "DESC_Apelido"
    t.string   "DESC_EstadoCivil"
    t.string   "NOME_Conjuge"
    t.string   "DESC_TelefoneFixo"
    t.string   "DESC_TelefoneCelular"
    t.date     "DATA_Decisao"
    t.integer  "NUMR_QtdFilhos"
    t.boolean  "FLAG_Discipulo"
    t.boolean  "FLAG_Reconciliacao"
    t.integer  "FLAG_OcasiaoRecebeuCristo"
    t.boolean  "FLAG_Trabalhando"
    t.string   "DESC_MomentoEstudoBiblico"
    t.string   "NUMR_RG"
    t.date     "DATA_EmissaoRG"
    t.string   "NUMR_CPF",                  limit: 11
    t.string   "NOME_Pai"
    t.string   "NOME_Mae"
    t.date     "DATA_NascConjuge"
    t.date     "DATA_Casamento"
    t.string   "NUMR_TituloEleitoral"
    t.date     "DATA_Batismo"
    t.string   "DESC_IgrejaBatismo"
    t.boolean  "FLAG_DoadorSangue"
    t.boolean  "FLAG_DoadorOrgao"
    t.boolean  "FLAG_Discipulador"
    t.boolean  "FLAG_Consolidador"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "NUMR_Codigo"
    t.time     "hora_estudobiblico"
    t.integer  "sivic_cidade_id"
  end

  add_index "sivic_discipulos", ["sivic_celula_id"], name: "index_sivic_discipulos_on_sivic_celula_id", using: :btree
  add_index "sivic_discipulos", ["sivic_endereco_id"], name: "index_sivic_discipulos_on_sivic_endereco_id", using: :btree
  add_index "sivic_discipulos", ["sivic_escolaridade_id"], name: "index_sivic_discipulos_on_sivic_escolaridade_id", using: :btree
  add_index "sivic_discipulos", ["sivic_pessoa_id"], name: "index_sivic_discipulos_on_sivic_pessoa_id", using: :btree
  add_index "sivic_discipulos", ["sivic_profissao_id"], name: "index_sivic_discipulos_on_sivic_profissao_id", using: :btree
  add_index "sivic_discipulos", ["sivic_rede_id"], name: "index_sivic_discipulos_on_sivic_rede_id", using: :btree

  create_table "sivic_enderecos", force: true do |t|
    t.string   "DESC_Bairro"
    t.string   "DESC_Rua"
    t.string   "DESC_Complemento"
    t.string   "DESC_Pontoreferencia"
    t.string   "NUMR_Cep"
    t.integer  "sivic_cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_enderecos", ["sivic_cidade_id"], name: "index_sivic_enderecos_on_sivic_cidade_id", using: :btree

  create_table "sivic_escolaridades", force: true do |t|
    t.string   "NOME_escolaridade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sivic_estados", force: true do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sivic_eventos", force: true do |t|
    t.string   "desc_evento"
    t.text     "DESC_resumo"
    t.decimal  "VARL_inscricao",       precision: 10, scale: 2
    t.date     "DATA_inicio"
    t.date     "DATA_fim"
    t.boolean  "FLAG_ilimitado"
    t.integer  "NUMR_qdtVagas"
    t.integer  "User_id"
    t.integer  "sivic_igreja_id"
    t.integer  "sivic_endereco_id"
    t.integer  "sivic_tipo_evento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "data_encerramento"
  end

  add_index "sivic_eventos", ["User_id"], name: "index_sivic_eventos_on_User_id", using: :btree
  add_index "sivic_eventos", ["sivic_endereco_id"], name: "index_sivic_eventos_on_sivic_endereco_id", using: :btree
  add_index "sivic_eventos", ["sivic_igreja_id"], name: "index_sivic_eventos_on_sivic_igreja_id", using: :btree
  add_index "sivic_eventos", ["sivic_tipo_evento_id"], name: "index_sivic_eventos_on_sivic_tipo_evento_id", using: :btree

  create_table "sivic_fornecedors", force: true do |t|
    t.string   "nome_fornecedor"
    t.string   "numr_cnpj"
    t.string   "numr_cpf"
    t.string   "numr_telefone"
    t.string   "nome_responsavel"
    t.string   "desc_fornecedor"
    t.integer  "sivic_endereco_id"
    t.integer  "sivic_igreja_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_fornecedors", ["sivic_endereco_id"], name: "index_sivic_fornecedors_on_sivic_endereco_id", using: :btree
  add_index "sivic_fornecedors", ["sivic_igreja_id"], name: "index_sivic_fornecedors_on_sivic_igreja_id", using: :btree
  add_index "sivic_fornecedors", ["user_id"], name: "index_sivic_fornecedors_on_user_id", using: :btree

  create_table "sivic_igrejas", force: true do |t|
    t.integer  "father_id"
    t.integer  "integer"
    t.string   "NOME_igreja"
    t.string   "NUMR_telefone"
    t.string   "NOME_responsavel"
    t.string   "NUMR_cnpj"
    t.integer  "sivic_endereco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_igrejas", ["sivic_endereco_id"], name: "index_sivic_igrejas_on_sivic_endereco_id", using: :btree

  create_table "sivic_lancamentos", force: true do |t|
    t.string   "nome_lancamento"
    t.decimal  "valr_lancamento"
    t.date     "data_vencimento"
    t.date     "data_competencia"
    t.boolean  "flag_pago"
    t.boolean  "flag_dizimo"
    t.integer  "numr_recorrencia"
    t.integer  "numr_parcela"
    t.integer  "numr_referenciaparcela"
    t.integer  "sivic_category_id"
    t.integer  "sivic_centrocusto_id"
    t.integer  "sivic_rede_id"
    t.integer  "sivic_tipmovfinanceiro_id"
    t.integer  "sivic_pessoa_id"
    t.integer  "sivic_fornecedor_id"
    t.integer  "sivic_igreja_id"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.datetime "data_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "codi_parcela"
    t.decimal  "valr_descontotaxa"
    t.decimal  "valr_jurosmulta"
    t.decimal  "valr_recebido"
    t.integer  "sivic_contabanco_id"
    t.date     "data_pagamento"
    t.decimal  "valr_pago"
  end

  add_index "sivic_lancamentos", ["sivic_category_id"], name: "index_sivic_lancamentos_on_sivic_category_id", using: :btree
  add_index "sivic_lancamentos", ["sivic_centrocusto_id"], name: "index_sivic_lancamentos_on_sivic_centrocusto_id", using: :btree
  add_index "sivic_lancamentos", ["sivic_fornecedor_id"], name: "index_sivic_lancamentos_on_sivic_fornecedor_id", using: :btree
  add_index "sivic_lancamentos", ["sivic_igreja_id"], name: "index_sivic_lancamentos_on_sivic_igreja_id", using: :btree
  add_index "sivic_lancamentos", ["sivic_pessoa_id"], name: "index_sivic_lancamentos_on_sivic_pessoa_id", using: :btree
  add_index "sivic_lancamentos", ["sivic_rede_id"], name: "index_sivic_lancamentos_on_sivic_rede_id", using: :btree
  add_index "sivic_lancamentos", ["sivic_tipmovfinanceiro_id"], name: "index_sivic_lancamentos_on_sivic_tipmovfinanceiro_id", using: :btree

  create_table "sivic_licaos", force: true do |t|
    t.string   "nome_licao"
    t.integer  "sivic_igreja_id"
    t.integer  "sivic_turmamoduloprofessor_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_licaos", ["sivic_igreja_id"], name: "index_sivic_licaos_on_sivic_igreja_id", using: :btree
  add_index "sivic_licaos", ["sivic_turmamoduloprofessor_id"], name: "index_sivic_licaos_on_sivic_turmamoduloprofessor_id", using: :btree

  create_table "sivic_ministerios", force: true do |t|
    t.string   "nome_ministerio"
    t.string   "sigl_ministerio"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_ministerios", ["sivic_igreja_id"], name: "index_sivic_ministerios_on_sivic_igreja_id", using: :btree

  create_table "sivic_moduloescolas", force: true do |t|
    t.integer  "sivic_igreja_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.string   "nome_modulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_moduloescolas", ["sivic_igreja_id"], name: "index_sivic_moduloescolas_on_sivic_igreja_id", using: :btree

  create_table "sivic_moduloturmas", force: true do |t|
    t.integer  "sivic_moduloescola_id"
    t.integer  "sivic_turma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_moduloturmas", ["sivic_moduloescola_id"], name: "index_sivic_moduloturmas_on_sivic_moduloescola_id", using: :btree
  add_index "sivic_moduloturmas", ["sivic_turma_id"], name: "index_sivic_moduloturmas_on_sivic_turma_id", using: :btree

  create_table "sivic_movimentofinanceiros", force: true do |t|
    t.decimal  "VALR_movimento"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.boolean  "FLAG_baixa",                default: false
    t.integer  "sivic_tipmovfinanceiro_id"
    t.integer  "sivic_evento_id"
    t.datetime "DATA_exclusao"
    t.integer  "user_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "DESC_movimento"
    t.decimal  "valr_restante"
  end

  add_index "sivic_movimentofinanceiros", ["sivic_evento_id"], name: "index_sivic_movimentofinanceiros_on_sivic_evento_id", using: :btree
  add_index "sivic_movimentofinanceiros", ["sivic_tipmovfinanceiro_id"], name: "index_sivic_movimentofinanceiros_on_sivic_tipmovfinanceiro_id", using: :btree

  create_table "sivic_partevenrelacelulas", force: true do |t|
    t.integer  "sivic_relatorioscelula_id"
    t.integer  "sivic_participantecelula_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sivic_sitpartcelula_id"
  end

  add_index "sivic_partevenrelacelulas", ["sivic_participantecelula_id"], name: "index_sivic_partevenrelacelulas_on_sivic_participantecelula_id", using: :btree
  add_index "sivic_partevenrelacelulas", ["sivic_relatorioscelula_id"], name: "index_sivic_partevenrelacelulas_on_sivic_relatorioscelula_id", using: :btree
  add_index "sivic_partevenrelacelulas", ["sivic_sitpartcelula_id"], name: "index_sivic_partevenrelacelulas_on_sivic_sitpartcelula_id", using: :btree

  create_table "sivic_parteventos", force: true do |t|
    t.integer  "sivic_pessoa_id"
    t.integer  "sivic_evento_id"
    t.integer  "sivic_movimentofinanceiro_id"
    t.boolean  "flag_naoparticipou"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "flag_passando"
    t.string   "desc_convidadopor"
  end

  add_index "sivic_parteventos", ["sivic_evento_id"], name: "index_sivic_parteventos_on_sivic_evento_id", using: :btree
  add_index "sivic_parteventos", ["sivic_movimentofinanceiro_id"], name: "index_sivic_parteventos_on_sivic_movimentofinanceiro_id", using: :btree
  add_index "sivic_parteventos", ["sivic_pessoa_id"], name: "index_sivic_parteventos_on_sivic_pessoa_id", using: :btree

  create_table "sivic_participantecelulas", force: true do |t|
    t.string   "nome_participante"
    t.string   "DESC_Email"
    t.string   "NUMR_Telefone"
    t.integer  "sivic_celula_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sivic_sitpartcelula_id"
  end

  add_index "sivic_participantecelulas", ["sivic_celula_id"], name: "index_sivic_participantecelulas_on_sivic_celula_id", using: :btree
  add_index "sivic_participantecelulas", ["sivic_sitpartcelula_id"], name: "index_sivic_participantecelulas_on_sivic_sitpartcelula_id", using: :btree

  create_table "sivic_pessoas", force: true do |t|
    t.integer  "father_id"
    t.integer  "integer"
    t.string   "nome_pessoa"
    t.string   "DESC_email"
    t.string   "DESC_observacao"
    t.integer  "sivic_igreja_id"
    t.integer  "User_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_pessoas", ["User_id"], name: "index_sivic_pessoas_on_User_id", using: :btree
  add_index "sivic_pessoas", ["sivic_igreja_id"], name: "index_sivic_pessoas_on_sivic_igreja_id", using: :btree

  create_table "sivic_professors", force: true do |t|
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "sivic_pessoa_id"
    t.integer  "user_bloqueio"
    t.datetime "DATA_bloqueio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sivic_igreja_id"
  end

  add_index "sivic_professors", ["sivic_igreja_id"], name: "index_sivic_professors_on_sivic_igreja_id", using: :btree
  add_index "sivic_professors", ["sivic_pessoa_id"], name: "index_sivic_professors_on_sivic_pessoa_id", using: :btree

  create_table "sivic_profissaos", force: true do |t|
    t.string   "profissao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sivic_redes", force: true do |t|
    t.string   "nome_rede"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_redes", ["sivic_igreja_id"], name: "index_sivic_redes_on_sivic_igreja_id", using: :btree

  create_table "sivic_relatorioscelulas", force: true do |t|
    t.integer  "sivic_celula_id"
    t.date     "DATA_Reuniao"
    t.time     "DATA_Horainicio"
    t.time     "DATA_HoraTermino"
    t.integer  "NUMR_NumVisitante"
    t.integer  "NUMR_NumParticipante"
    t.string   "DESC_AssuntoEstudo"
    t.string   "DESC_TextoBiblico"
    t.decimal  "VALR_Oferta"
    t.integer  "NUMR_Decisoes"
    t.text     "DESC_OutrasInformacoes"
    t.integer  "sivic_situacoesrelatorio_id"
    t.integer  "NUMR_QtdNovoConvertido"
    t.integer  "NUMR_QtdResgate"
    t.integer  "NUMR_QtdPreEncontro"
    t.integer  "NUMR_QtdEncontro"
    t.integer  "NUMR_QtdPosEncontro"
    t.integer  "NUMR_QtdEscoLid1"
    t.integer  "NUMR_EscoLid2"
    t.integer  "NUMR_EscoLid3"
    t.integer  "NUMR_QtdLidCelula"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sivic_movimentofinanceiro_id"
  end

  add_index "sivic_relatorioscelulas", ["sivic_celula_id"], name: "index_sivic_relatorioscelulas_on_sivic_celula_id", using: :btree
  add_index "sivic_relatorioscelulas", ["sivic_movimentofinanceiro_id"], name: "index_sivic_relatorioscelulas_on_sivic_movimentofinanceiro_id", using: :btree
  add_index "sivic_relatorioscelulas", ["sivic_situacoesrelatorio_id"], name: "index_sivic_relatorioscelulas_on_sivic_situacoesrelatorio_id", using: :btree

  create_table "sivic_sitpartcelulas", force: true do |t|
    t.string   "DESC_situacao"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_sitpartcelulas", ["sivic_igreja_id"], name: "index_sivic_sitpartcelulas_on_sivic_igreja_id", using: :btree

  create_table "sivic_situacoesrelatorios", force: true do |t|
    t.string   "DESC_Situacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sivic_tipmovfinanceiros", force: true do |t|
    t.string   "DESC_movimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sivic_tipo_eventos", force: true do |t|
    t.string   "desc_tipoevento"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_tipo_eventos", ["sivic_igreja_id"], name: "index_sivic_tipo_eventos_on_sivic_igreja_id", using: :btree

  create_table "sivic_turmaalunos", force: true do |t|
    t.integer  "sivic_turma_id"
    t.integer  "sivic_pessoa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_bloqueio"
    t.date     "data_bloqueio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sivic_igreja_id"
  end

  add_index "sivic_turmaalunos", ["sivic_igreja_id"], name: "index_sivic_turmaalunos_on_sivic_igreja_id", using: :btree
  add_index "sivic_turmaalunos", ["sivic_pessoa_id"], name: "index_sivic_turmaalunos_on_sivic_pessoa_id", using: :btree
  add_index "sivic_turmaalunos", ["sivic_turma_id"], name: "index_sivic_turmaalunos_on_sivic_turma_id", using: :btree

  create_table "sivic_turmamoduloprofessors", force: true do |t|
    t.integer  "sivic_professor_id"
    t.integer  "sivic_moduloescola_id"
    t.integer  "sivic_turma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sivic_igreja_id"
  end

  add_index "sivic_turmamoduloprofessors", ["sivic_igreja_id"], name: "index_sivic_turmamoduloprofessors_on_sivic_igreja_id", using: :btree
  add_index "sivic_turmamoduloprofessors", ["sivic_moduloescola_id"], name: "index_sivic_turmamoduloprofessors_on_sivic_moduloescola_id", using: :btree
  add_index "sivic_turmamoduloprofessors", ["sivic_professor_id"], name: "index_sivic_turmamoduloprofessors_on_sivic_professor_id", using: :btree
  add_index "sivic_turmamoduloprofessors", ["sivic_turma_id"], name: "index_sivic_turmamoduloprofessors_on_sivic_turma_id", using: :btree

  create_table "sivic_turmas", force: true do |t|
    t.integer  "sivic_igreja_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.string   "DESC_turma"
    t.date     "DATA_Inicio"
    t.date     "DATA_Fim"
    t.integer  "NUMR_QdtVagas"
    t.date     "DATA_bloqueio"
    t.integer  "user_bloqueio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sivic_curso_id"
  end

  add_index "sivic_turmas", ["sivic_curso_id"], name: "index_sivic_turmas_on_sivic_curso_id", using: :btree
  add_index "sivic_turmas", ["sivic_igreja_id"], name: "index_sivic_turmas_on_sivic_igreja_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "sivic_pessoa_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["sivic_pessoa_id"], name: "index_users_on_sivic_pessoa_id", using: :btree

end
