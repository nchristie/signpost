class VideoUrl < ApplicationRecord
  belongs_to :written_term
  has_many :url_categories
end
