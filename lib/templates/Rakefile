%w{ rubygems bundler find}.each { |lib| require lib }

namespace :db do
  desc "Run all migrations in db/migrate"
  task :migrate => :connect do
    Sequel.extension(:migration)
    Sequel::Migrator.apply(DB, "db/migrate")
  end

  task :connect => :environment do
    require "./config/initializers/database"
  end
end

task :environment, [:env] do |cmd, args|
  Bundler.require
  ENV['RACK_ENV'] = args[:env] || "development"
  %w{ ./config/initializers ./lib }.each do
    Find.find(lib) { |f| require f unless f.match(/\/\..+$/) || File.directory?(f) }
  end
end

