class CreateWrittenTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :written_terms do |t|
      t.text :name
      t.belongs_to :written_language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
