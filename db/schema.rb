# frozen_string_literal: true

ActiveRecord::Schema[7.0].define(version: 20_230_228_054_145) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.text 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_categories_on_name', unique: true
  end

  create_table 'url_categories', force: :cascade do |t|
    t.bigint 'category_id', null: false
    t.bigint 'video_url_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_url_categories_on_category_id'
    t.index ['video_url_id'], name: 'index_url_categories_on_video_url_id'
  end

  create_table 'url_terms', force: :cascade do |t|
    t.bigint 'written_term_id', null: false
    t.bigint 'video_url_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['video_url_id'], name: 'index_url_terms_on_video_url_id'
    t.index ['written_term_id'], name: 'index_url_terms_on_written_term_id'
  end

  create_table 'video_urls', force: :cascade do |t|
    t.text 'url'
    t.boolean 'approved', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['url'], name: 'index_video_urls_on_url', unique: true
  end

  create_table 'votes', force: :cascade do |t|
    t.integer 'up_votes'
    t.integer 'down_votes'
    t.bigint 'url_category_id', null: false
    t.bigint 'url_term_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['url_category_id'], name: 'index_votes_on_url_category_id'
    t.index %w[url_term_id url_category_id], name: 'index_votes_on_url_term_id_and_url_category_id', unique: true
    t.index ['url_term_id'], name: 'index_votes_on_url_term_id'
  end

  create_table 'written_languages', force: :cascade do |t|
    t.text 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_written_languages_on_name', unique: true
  end

  create_table 'written_terms', force: :cascade do |t|
    t.text 'name'
    t.bigint 'written_language_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['written_language_id'], name: 'index_written_terms_on_written_language_id'
  end

  add_foreign_key 'url_categories', 'categories'
  add_foreign_key 'url_categories', 'video_urls'
  add_foreign_key 'url_terms', 'video_urls'
  add_foreign_key 'url_terms', 'written_terms'
  add_foreign_key 'votes', 'url_categories'
  add_foreign_key 'votes', 'url_terms'
  add_foreign_key 'written_terms', 'written_languages'
end
