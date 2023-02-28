# frozen_string_literal: true

class WrittenTerm < ApplicationRecord
  belongs_to :written_language
  has_many :term_url
  has_many :video_url, through: :term_url
end
