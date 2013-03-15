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

ActiveRecord::Schema.define(:version => 20130315233157) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "authentications", :force => true do |t|
    t.integer  "vendedor_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "catalogos", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "producto_id"
    t.integer  "vendedor_id"
  end

  add_index "catalogos", ["producto_id", "vendedor_id"], :name => "index_catalogos_on_producto_id_and_vendedor_id", :unique => true

  create_table "clientes", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "ciudad"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "pedido_id"
  end

  create_table "comunas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "code"
    t.string   "provincia"
    t.string   "region"
    t.string   "region_number"
  end

  create_table "empresas", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "nombre"
    t.string   "rut"
    t.string   "url"
    t.string   "representante"
    t.string   "direccion"
    t.string   "telefono"
    t.integer  "comuna_id"
    t.boolean  "active",                 :default => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "empresas", ["confirmation_token"], :name => "index_empresas_on_confirmation_token", :unique => true
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
    t.integer  "comision"
  end

  create_table "universidads", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendedors", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "nombre"
    t.string   "rut"
    t.string   "direccion"
    t.integer  "comuna_id"
    t.integer  "universidad_id"
    t.string   "telefono"
    t.string   "gender"
    t.boolean  "active",                 :default => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "vendedors", ["confirmation_token"], :name => "index_vendedors_on_confirmation_token", :unique => true
  add_index "vendedors", ["email"], :name => "index_vendedors_on_email", :unique => true
  add_index "vendedors", ["reset_password_token"], :name => "index_vendedors_on_reset_password_token", :unique => true

end
