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

ActiveRecord::Schema.define(version: 20140113145623) do

  create_table "sivic_cidades", force: true do |t|
    t.string   "nome_cidade"
    t.integer  "sivic_estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_cidades", ["sivic_estado_id"], name: "index_sivic_cidades_on_sivic_estado_id"

  create_table "sivic_enderecos", force: true do |t|
    t.string   "DESC_Bairro"
    t.string   "DESC_Rua"
    t.string   "DESC_Complemento"
    t.string   "DESC_Pontoreferencia"
    t.integer  "NUMR_Cep"
    t.integer  "sivic_cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_enderecos", ["sivic_cidade_id"], name: "index_sivic_enderecos_on_sivic_cidade_id"

  create_table "sivic_escolaridades", force: true do |t|
    t.string   "escolaridade"
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
    t.string   "DESC_evento"
    t.text     "DESC_resumo"
    t.decimal  "VARL_inscricao",      precision: 10, scale: 2
    t.datetime "DATA_inicio"
    t.datetime "DATA_fim"
    t.integer  "FLAG_ilimitado"
    t.integer  "NUMR_qdtVagas"
    t.integer  "sivic_user_id"
    t.integer  "sivic_igreja_id"
    t.integer  "sivic_endereco_id"
    t.integer  "sivic_tipoEvento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_eventos", ["sivic_endereco_id"], name: "index_sivic_eventos_on_sivic_endereco_id"
  add_index "sivic_eventos", ["sivic_igreja_id"], name: "index_sivic_eventos_on_sivic_igreja_id"
  add_index "sivic_eventos", ["sivic_tipoEvento_id"], name: "index_sivic_eventos_on_sivic_tipoEvento_id"
  add_index "sivic_eventos", ["sivic_user_id"], name: "index_sivic_eventos_on_sivic_user_id"

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

  add_index "sivic_igrejas", ["sivic_endereco_id"], name: "index_sivic_igrejas_on_sivic_endereco_id"

  create_table "sivic_ministerios", force: true do |t|
    t.string   "nome_ministerio"
    t.string   "sigl_ministerio"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_ministerios", ["sivic_igreja_id"], name: "index_sivic_ministerios_on_sivic_igreja_id"

  create_table "sivic_pessoas", force: true do |t|
    t.integer  "father_id"
    t.integer  "integer"
    t.string   "NOME_pessoa"
    t.string   "DESC_email"
    t.string   "DESC_observacao"
    t.integer  "sivic_igreja_id"
    t.integer  "User_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_pessoas", ["User_id"], name: "index_sivic_pessoas_on_User_id"
  add_index "sivic_pessoas", ["sivic_igreja_id"], name: "index_sivic_pessoas_on_sivic_igreja_id"

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

  add_index "sivic_redes", ["sivic_igreja_id"], name: "index_sivic_redes_on_sivic_igreja_id"

  create_table "sivic_tipo_eventos", force: true do |t|
    t.string   "desc_tipoevento"
    t.integer  "sivic_igreja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_tipo_eventos", ["sivic_igreja_id"], name: "index_sivic_tipo_eventos_on_sivic_igreja_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
