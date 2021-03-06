# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_180_115_093_558) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'urls', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'initial_url', null: false
    t.string 'short_url', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'status', default: 0
    t.index ['short_url'], name: 'index_urls_on_short_url'
    t.index ['user_id'], name: 'index_urls_on_user_id'
  end

  create_table 'userfiles', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'file'
    t.string 'short_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['short_url'], name: 'index_userfiles_on_short_url'
    t.index ['user_id'], name: 'index_userfiles_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'token'
    t.integer 'role', default: 0
    t.integer 'urls_count', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['token'], name: 'index_users_on_token'
  end
end
