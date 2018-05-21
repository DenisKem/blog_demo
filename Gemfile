source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'active_model_serializers', '~> 0.10'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails', '~> 5.2.0'
gem 'pg', '~> 1.0'
gem 'puma', '~> 3.11'

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.6'
end
