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

ActiveRecord::Schema.define(version: 20131230191314) do

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

  create_table "sivic_igrejas", force: true do |t|
    t.integer  "father_id"
    t.string   "NOME_igreja"
    t.string   "NUMR_telefone"
    t.string   "NOME_responsavel"
    t.string   "NUMR_cnpj"
    t.integer  "sivic_endereco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sivic_igrejas", ["sivic_endereco_id"], name: "index_sivic_igrejas_on_sivic_endereco_id"

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

end
