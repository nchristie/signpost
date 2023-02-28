# frozen_string_literal: true

class WrittenLanguage < ApplicationRecord
  has_many :written_term
  has_many :term_url, through: :written_term
end
