# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :up_votes, from: nil, to: 0
      t.integer :down_votes, from: nil, to: 0
      t.belongs_to :url_category, null: false, foreign_key: true
      t.belongs_to :url_term, null: false, foreign_key: true

      t.timestamps
    end
    add_index :votes, %i[url_term_id url_category_id], unique: true
  end
end
