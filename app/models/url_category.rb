class UrlCategory < ApplicationRecord
  belongs_to :category
  belongs_to :video_url
  has_many :votes
end
