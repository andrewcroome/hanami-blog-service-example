# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.0.0.beta"
gem "hanami-router", "~> 2.0.0.beta"
gem "hanami-controller", "~> 2.0.0.beta"
gem "hanami-validations", "~> 2.0.0.beta"

gem "dry-types"
gem "puma"
gem "rake"

# Database
gem "pg", "~> 1.2"
gem "rom", "~> 5.2"
gem "rom-factory", github: "rom-rb/rom-factory" # used in DB seeds as well as tests
gem "rom-sql", "~> 3.2"
gem "sequel", "~> 5.0"
gem "sequel_pg", "~> 1.7"

gem "dry-matcher"
gem "dry-monads"

group :development, :test do
  gem "dotenv"
end

group :cli, :development, :test do
  gem "hanami-rspec"
end

group :test do
  gem "rack-test"
end
