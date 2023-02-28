# frozen_string_literal: true

# WrittenLanguages
written_english = WrittenLanguage.create(name: 'English')
written_german = WrittenLanguage.create(name: 'Deutsch')

# Categories
makaton = Category.create(name: 'Makaton')
bsl = Category.create(name: 'British Sign Language')
asl = Category.create(name: 'American Sign Language')
dgs = Category.create(name: 'Deutsche Gebärdensprache')

# WrittenTerms
milk = WrittenTerm.create(name: 'milk', written_language: written_english)
purple = WrittenTerm.create(name: 'purple', written_language: written_english)
lila = WrittenTerm.create(name: 'lila', written_language: written_german)

# VideoUrls
makaton_milk = VideoUrl.create(url: 'https://youtube.com/embed/ZOPTI7aG3iI?start=4&end=7', approved: false)
# purple
makaton_purple = VideoUrl.create(url: 'https://www.youtube.com/embed/fZaPigFJFd8?start=31&end=36', approved: false)
bsl_purple = VideoUrl.create(url: 'https://www.youtube.com/embed/i-IF86y1z1k?start=67&end=72', approved: false)
asl_purple = VideoUrl.create(url: 'https://www.youtube.com/embed/Sh6W7OOfnoQ?start=5&end=10', approved: false)
dgs_lila = VideoUrl.create(url: 'https://www.youtube.com/embed/AdiPcBQCSF4?start=102&end=107', approved: false)

# TermUrls
makaton_milk_depicts_milk = TermUrl.create(video_url: makaton_milk, written_term: milk)
makaton_purple_depicts_purple = TermUrl.create(video_url: makaton_purple, written_term: purple)
bsl_purple_depicts_purple = TermUrl.create(video_url: bsl_purple, written_term: purple)
asl_purple_depicts_purple = TermUrl.create(video_url: asl_purple, written_term: purple)
dgs_lila_depicts_purple = TermUrl.create(video_url: dgs_lila, written_term: purple)
dgs_lila_depitcs_lila = TermUrl.create(video_url: dgs_lila, written_term: lila)

# UrlCategories
makaton_milk_is_in_makaton = UrlCategory.create(category: makaton, video_url: makaton_milk)
makaton_purple_is_in_makaton = UrlCategory.create(category: makaton, video_url: makaton_purple)
bsl_purple_is_in_bsl = UrlCategory.create(category: bsl, video_url: bsl_purple)
asl_purple_is_in_asl = UrlCategory.create(category: asl, video_url: asl_purple)
dgs_lila_is_in_dgs = UrlCategory.create(category: dgs, video_url: dgs_lila)

# Votes
Vote.create(term_url: makaton_milk_depicts_milk, url_category: makaton_milk_is_in_makaton, up_votes: 5, down_votes: 1)
Vote.create(term_url: makaton_milk_depicts_milk, url_category: makaton_milk_is_in_makaton, up_votes: 5, down_votes: 1)
