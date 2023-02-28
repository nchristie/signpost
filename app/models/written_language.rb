# frozen_string_literal: true

class WrittenLanguage < ApplicationRecord
  has_many :written_term
  has_many :url_term, through: :written_term
end
