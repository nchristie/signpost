bin/rails db:environment:set RAILS_ENV=development && \
bin/rails db:{drop,create,migrate,seed}
