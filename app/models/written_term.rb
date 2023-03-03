# frozen_string_literal: true

class WrittenTerm < ApplicationRecord
  belongs_to :written_language
  has_many :url_term
  has_many :video_url, through: :url_term

  accepts_nested_attributes_for :written_language
end
