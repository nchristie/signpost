# frozen_string_literal: true

class WrittenTerm < ApplicationRecord
  belongs_to :written_language
  has_many :term_urls
  has_many :video_urls, through: :term_urls
end
