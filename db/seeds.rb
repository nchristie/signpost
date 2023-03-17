# frozen_string_literal: true

require 'csv'

# WrittenLanguages
written_english = WrittenLanguage.create(name: 'English')
written_german = WrittenLanguage.create(name: 'Deutsch')

# Categories
makaton = Category.create(name: 'Makaton')
bsl = Category.create(name: 'British Sign Language')
asl = Category.create(name: 'American Sign Language')
dgs = Category.create(name: 'Deutsche Gebaerdensprache')

# WrittenTerms
milk = WrittenTerm.create(name: 'milk', written_language: written_english)
purple = WrittenTerm.create(name: 'purple', written_language: written_english)
lila = WrittenTerm.create(name: 'lila', written_language: written_german)

# VideoUrls
makaton_milk = VideoUrl.create(url: 'https://youtube.com/embed/ZOPTI7aG3iI?start=4&end=7')
# purple
makaton_purple = VideoUrl.create(url: 'https://www.youtube.com/embed/fZaPigFJFd8?start=31&end=36')
bsl_purple = VideoUrl.create(url: 'https://www.youtube.com/embed/i-IF86y1z1k?start=67&end=72')
bsl_purple_alt = VideoUrl.create(url: 'https://www.youtube.com/embed/w3CV1wvghmo?start=07&end=2')
asl_purple = VideoUrl.create(url: 'https://www.youtube.com/embed/Sh6W7OOfnoQ?start=5&end=10')
dgs_lila = VideoUrl.create(url: 'https://www.youtube.com/embed/AdiPcBQCSF4?start=102&end=107')

# UrlTerms
makaton_milk_depicts_milk = UrlTerm.create(video_url: makaton_milk, written_term: milk)
makaton_purple_depicts_purple = UrlTerm.create(video_url: makaton_purple, written_term: purple)
makaton_purple_depicts_lila = UrlTerm.create(video_url: makaton_purple, written_term: lila)
bsl_purple_depicts_purple = UrlTerm.create(video_url: bsl_purple, written_term: purple)
bsl_purple_depicts_lila = UrlTerm.create(video_url: bsl_purple, written_term: lila)
bsl_purple_alt_depicts_purple = UrlTerm.create(video_url: bsl_purple_alt, written_term: purple)
asl_purple_depicts_purple = UrlTerm.create(video_url: asl_purple, written_term: purple)
asl_purple_depicts_lila = UrlTerm.create(video_url: asl_purple, written_term: lila)
dgs_lila_depicts_purple = UrlTerm.create(video_url: dgs_lila, written_term: purple)
dgs_lila_depitcs_lila = UrlTerm.create(video_url: dgs_lila, written_term: lila)

# UrlCategories
makaton_milk_is_in_makaton = UrlCategory.create(category: makaton, video_url: makaton_milk)
makaton_purple_is_in_makaton = UrlCategory.create(category: makaton, video_url: makaton_purple)
bsl_purple_is_in_bsl = UrlCategory.create(category: bsl, video_url: bsl_purple)
bsl_purple_alt_is_in_bsl = UrlCategory.create(category: bsl, video_url: bsl_purple_alt)
asl_purple_is_in_asl = UrlCategory.create(category: asl, video_url: asl_purple)
dgs_lila_is_in_dgs = UrlCategory.create(category: dgs, video_url: dgs_lila)

# Votes
Vote.create(url_term: makaton_milk_depicts_milk, url_category: makaton_milk_is_in_makaton)
Vote.create(url_term: makaton_purple_depicts_purple, url_category: makaton_purple_is_in_makaton)
Vote.create(url_term: bsl_purple_depicts_purple, url_category: bsl_purple_is_in_bsl)
Vote.create(url_term: bsl_purple_alt_depicts_purple, url_category: bsl_purple_alt_is_in_bsl)
Vote.create(url_term: asl_purple_depicts_purple, url_category: asl_purple_is_in_asl)
Vote.create(url_term: dgs_lila_depicts_purple, url_category: dgs_lila_is_in_dgs)
Vote.create(url_term: dgs_lila_depitcs_lila, url_category: dgs_lila_is_in_dgs)


table = CSV.parse(File.read("db/links_formatted.csv"), headers: false, col_sep: ',')

# Define the category and written language
category = Category.find_by(name: 'British Sign Language')
language = WrittenLanguage.find_by(name: 'English')

# Loop through the array and create a new UrlTerm for each element
table.each do |element|
  # Extract the written term and video URL from the element
  written_term_name, video_url_str = element

  # Create a new VideoUrl with the provided URL
  video_url = VideoUrl.find_or_create_by(url: video_url_str, approved: true)

  # Create a new WrittenTerm with the provided name and language
  written_term = WrittenTerm.find_or_create_by(name: written_term_name.downcase, written_language: language)

  # Create a new UrlTerm with the newly created VideoUrl and WrittenTerm, and assign it to the desired category
  UrlTerm.create(video_url: video_url, written_term: written_term)
  UrlCategory.create(category: category, video_url: video_url)
end
