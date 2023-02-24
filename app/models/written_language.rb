class WrittenLanguage < ApplicationRecord
    has_many :written_terms
    has_many :video_urls, through: :written_terms
end
