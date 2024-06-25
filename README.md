# signpost
API for finding urls to sign language videos

## Working with this repo

### Prerequisites:
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