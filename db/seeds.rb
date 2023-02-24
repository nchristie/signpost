# frozen_string_literal: true

# WrittenLanguages
written_english = WrittenLanguage.create(name: "English")
written_german = WrittenLanguage.create(name: "Deutsch")

# Categories
makaton = Category.create(name: "Makaton")
bsl = Category.create(name: "British Sign Language")
asl = Category.create(name:"American Sign Language")
dgs = Category.create(name:"Deutsche Gebärdensprache")



# WrittenTerms
milk = WrittenTerm.create(name: "milk", written_language: written_english)
purple = WrittenTerm.create(name: "purple", written_language: written_english)
lila = WrittenTerm.create(name: "lila", written_language: written_german)

# VideoUrls
makaton_milk = VideoUrl.create(url: "https://youtube.com/embed/ZOPTI7aG3iI?start=4&end=7", approved: false)
# purple
makaton_purple = VideoUrl.create(url: "https://www.youtube.com/embed/fZaPigFJFd8?start=31&end=36", approved: false)
bsl_purple = VideoUrl.create(url: "https://www.youtube.com/embed/i-IF86y1z1k?start=67&end=72", approved: false)
asl_purple = VideoUrl.create(url: "https://www.youtube.com/embed/Sh6W7OOfnoQ?start=5&end=10", approved: false)
dgs_lila = VideoUrl.create(url: "https://www.youtube.com/embed/AdiPcBQCSF4?start=102&end=107", approved: false)

# TermUrls
TermUrl.create(video_url: makaton_milk, written_term: milk)
TermUrl.create(video_url: makaton_purple, written_term: purple)
TermUrl.create(video_url: bsl_purple, written_term: purple)
TermUrl.create(video_url: asl_purple, written_term: purple)
TermUrl.create(video_url: dgs_lila, written_term: purple)
TermUrl.create(video_url: dgs_lila, written_term: lila)


# UrlCategories
UrlCategory.create(category: makaton, video_url: makaton_milk)
UrlCategory.create(category: makaton, video_url: makaton_purple)
UrlCategory.create(category: bsl, video_url: bsl_purple)
UrlCategory.create(category: bsl, video_url: asl_purple)
UrlCategory.create(category: dgs, video_url: dgs_lila)
