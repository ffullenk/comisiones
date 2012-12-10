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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121210040216) do

  create_table "empresas", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "nombre"
  end

  add_index "empresas", ["email"], :name => "index_empresas_on_email", :unique => true
  add_index "empresas", ["reset_password_token"], :name => "index_empresas_on_reset_password_token", :unique => true

  create_table "pedidos", :force => true do |t|
    t.integer  "producto_id"
    t.integer  "vendedor_id"
    t.integer  "empresa_id"
    t.integer  "cantidad"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "confirmado",  :default => false
  end

  create_table "productos", :force => true do |t|
    t.string   "nombre"
    t.integer  "precio"
    t.text     "descripcion"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "empresa_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "vendedors", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "nombre"
  end

  add_index "vendedors", ["email"], :name => "index_vendedors_on_email", :unique => true
  add_index "vendedors", ["reset_password_token"], :name => "index_vendedors_on_reset_password_token", :unique => true

end