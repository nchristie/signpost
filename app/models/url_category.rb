# frozen_string_literal: true

class UrlCategory < ApplicationRecord
  belongs_to :category
  belongs_to :video_url
end
