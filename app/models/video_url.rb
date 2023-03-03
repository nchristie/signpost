# frozen_string_literal: true

class VideoUrl < ApplicationRecord
  has_many :url_term
  has_many :url_category
  has_many :written_term, through: :url_term
  has_many :category, through: :url_category

  accepts_nested_attributes_for :url_term
  accepts_nested_attributes_for :url_category
end
