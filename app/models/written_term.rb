class WrittenTerm < ApplicationRecord
  belongs_to :written_language
  has_many :video_urls
end
