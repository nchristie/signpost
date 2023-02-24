class CreateUrlCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :url_categories do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :video_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
