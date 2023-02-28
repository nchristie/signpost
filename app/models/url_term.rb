# frozen_string_literal: true

class UrlTerm < ApplicationRecord
  belongs_to :written_term
  belongs_to :video_url
  has_many :vote
  has_one :written_language, through: :written_term
end
