# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :url_categories
  has_many :video_urls, through: :url_categories
end
