# frozen_string_literal: true

class CreateWrittenLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :written_languages do |t|
      t.text :name

      t.timestamps
    end
    add_index :written_languages, :name, unique: true
  end
end
