# frozen_string_literal: true

class CreateVideoUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :video_urls do |t|
      t.text :url
      t.boolean :approved

      t.timestamps
    end
    add_index :video_urls, :url, unique: true
  end
end
