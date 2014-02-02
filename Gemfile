source 'https://rubygems.org'

gem 'rails', '4.1.0.beta1'
gem 'pg'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',          group: :doc, require: false
gem 'thin'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'zeus'
end

group :test do
  gem 'factory_girl_rails'
end

platform :ruby do
  gem 'unicorn'
end
