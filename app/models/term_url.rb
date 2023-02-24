class TermUrl < ApplicationRecord
  belongs_to :written_term
  belongs_to :video_url
  has_many :votes
end
