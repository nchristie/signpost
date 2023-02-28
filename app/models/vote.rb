# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :url_category
  belongs_to :url_term
end
