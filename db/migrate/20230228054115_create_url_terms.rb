# frozen_string_literal: true

class CreateUrlTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :url_terms do |t|
      t.belongs_to :written_term, null: false, foreign_key: true
      t.belongs_to :video_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
