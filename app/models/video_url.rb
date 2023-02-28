# frozen_string_literal: true

class VideoUrl < ApplicationRecord
  has_many :term_url
  has_many :url_category
  has_many :written_term, through: :term_url
  has_many :category, through: :url_category
end
