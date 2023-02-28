# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :url_category
  has_many :video_url, through: :url_category
end
