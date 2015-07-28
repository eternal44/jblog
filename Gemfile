source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'faker', '~> 1.4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'pundit', '~> 1.0.1'
gem 'devise', '~> 3.5.1'
gem 'bootstrap-sass', '~> 3.3.4.1'
gem 'ransack', '~> 1.6.6'

group :development, :test do
  gem 'hirb'
  gem 'pg'
  gem 'byebug'
	gem 'annotate'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  # removed minitest-rails gem - kept throwing backtrace errors
  gem 'minitest-capybara'
  gem 'capybara'
  gem 'minitest-reporters'
  gem 'mini_backtrace'
end

group :production do
  gem 'pg'
  gem 'rails_12factor' 		
  gem 'puma'
end
