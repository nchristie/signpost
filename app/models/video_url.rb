# frozen_string_literal: true

class VideoUrl < ApplicationRecord
  has_many :term_urls
  has_many :url_categories
  has_many :written_terms, through: :term_urls
  has_many :categories, through: :url_categories
end
