# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :up_votes
      t.integer :down_votes
      t.belongs_to :url_category, null: false, foreign_key: true
      t.belongs_to :url_term, null: false, foreign_key: true

      t.timestamps
    end
  end
end
