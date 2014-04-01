source 'https://rubygems.org'

gem 'rails', '4.1.0.rc2'
gem 'pg'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',          group: :doc, require: false
gem 'thin'
gem 'rack-timeout'
gem 'acts-as-taggable-on'
gem 'sprockets', '2.11.0'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', require: 'bcrypt'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'zeus'
#  gem 'pry-rails'
end

group :test do
  gem 'factory_girl_rails'
end

gem 'formtastic', github: 'justinfrench/formtastic'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous', branch: 'rails-4.1'
gem 'activeadmin', github: 'gregbell/active_admin'
