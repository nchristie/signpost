# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :url_category
  belongs_to :url_term

  validate :video_url_match

  private

  def video_url_match
    return if url_term.video_url == url_category.video_url

    errors.add(:base, 'UrlTerm and UrlCategory must have the same VideoUrl')
  end
end
