source 'https://rubygems.org'

gem 'bootstrap-sass', '~> 3.3.3'  # Templating engine for responsive front-end
gem 'will_paginate', '~> 3.0.7'   # To paginate the results/jobs, better organized
gem 'coffee-rails', '~> 4.0.0'    # Coffee scripts
gem 'sass-rails', '~> 4.0.0'      # SCSS
gem 'uglifier', '>= 1.3.0'        # Minified JS
gem 'jbuilder', '~> 1.2'          # To support JSON
gem 'rails', '4.0.3'              # Rails framework
gem 'sendgrid-ruby'               # To support email functionality
gem 'jquery-rails'                # For JQuery libraries & functions
gem 'turbolinks'
gem 'feedjira'                    # To fetch and parse the atom feed provided by OSU
gem 'pg'                          # Postgresql database
gem 'whenever', :require => false # To run cron jobs to update & validate the jobs

group :development do
  gem 'sqlite3'                   # Sqlite3 database during development
end

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'rails_12factor'
  gem 'unicorn'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end