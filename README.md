# signpost
API for finding urls to sign language videos

## Working with this repo

### Prerequisites

- postgresql
- a ruby environment manager (such as rbenv or rvm)

### Set up and run server

From commandline:
- `bundle install`
- `bin/rails db:create`
- `bin/rails db:migrate`
- `bin/rails db:seed`
- `bin/rails server`
- Go to http://127.0.0.1:3000/api/v1/video_urls and you should see output from your request

### URL examples:

- index: http://127.0.0.1:3000/api/v1/video_urls
- index with updates to pagination: http://localhost:3000/api/v1/video_urls?page=2&per_page=10
- find specific sign videos: http://localhost:3000/api/v1/video_urls/find_urls?written_term=purple&category=British%20Sign%20Language&written_language=English


### Working with the front end

- Go to: https://github.com/nchristie/signpost-htmljscss-website and follow the instructions from the README.md