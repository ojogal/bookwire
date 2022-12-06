# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_203_101_430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'booking_statuses', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'booking_units', force: :cascade do |t|
    t.bigint 'booking_id'
    t.bigint 'unit_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['booking_id'], name: 'index_booking_units_on_booking_id'
    t.index ['unit_id'], name: 'index_booking_units_on_unit_id'
  end

  create_table 'bookings', force: :cascade do |t|
    t.datetime 'starts_at', precision: nil, null: false
    t.datetime 'ends_at', precision: nil, null: false
    t.bigint 'booking_status_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['booking_status_id'], name: 'index_bookings_on_booking_status_id'
    t.index ['user_id'], name: 'index_bookings_on_user_id'
  end

  create_table 'branches', force: :cascade do |t|
    t.string 'alias', null: false
    t.integer 'floors', null: false
    t.bigint 'brand_id', null: false
    t.bigint 'location_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['brand_id'], name: 'index_branches_on_brand_id'
    t.index ['location_id'], name: 'index_branches_on_location_id'
  end

  create_table 'brands', force: :cascade do |t|
    t.string 'title', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_brands_on_category_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'currencies', force: :cascade do |t|
    t.integer 'number', null: false
    t.string 'symbol', null: false
    t.string 'code', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'expenses', primary_key: '    expense_id', id: :serial, force: :cascade do |t|
    t.string '    title', limit: 30, null: false
    t.decimal '    price', precision: 10, scale: 2, null: false
    t.string '    category', limit: 30, null: false
    t.boolean '    essential', null: false
    t.datetime '    created_at', precision: nil, null: false
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'country'
    t.string 'state'
    t.string 'city'
    t.string 'district'
    t.string 'street'
    t.string 'building'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'payments', force: :cascade do |t|
    t.float 'amount', null: false
    t.bigint 'booking_id', null: false
    t.bigint 'currency_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['booking_id'], name: 'index_payments_on_booking_id'
    t.index ['currency_id'], name: 'index_payments_on_currency_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'todo', primary_key: '  todo_id', id: :serial, force: :cascade do |t|
    t.string '  description', limit: 225, null: false
  end

  create_table 'unit_types', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'units', force: :cascade do |t|
    t.integer 'seats', null: false
    t.boolean 'is_reserved', default: false
    t.integer 'floor'
    t.bigint 'unit_type_id', null: false
    t.bigint 'branch_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['branch_id'], name: 'index_units_on_branch_id'
    t.index ['unit_type_id'], name: 'index_units_on_unit_type_id'
  end

  create_table 'user_brands', force: :cascade do |t|
    t.bigint 'brand_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['brand_id'], name: 'index_user_brands_on_brand_id'
    t.index ['user_id'], name: 'index_user_brands_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'phone', null: false
    t.string 'email', null: false
    t.bigint 'role_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['role_id'], name: 'index_users_on_role_id'
  end

  add_foreign_key 'bookings', 'booking_statuses'
  add_foreign_key 'bookings', 'users'
  add_foreign_key 'branches', 'brands'
  add_foreign_key 'branches', 'locations'
  add_foreign_key 'brands', 'categories'
  add_foreign_key 'payments', 'bookings'
  add_foreign_key 'payments', 'currencies'
  add_foreign_key 'units', 'branches'
  add_foreign_key 'units', 'unit_types'
  add_foreign_key 'users', 'roles'
end
