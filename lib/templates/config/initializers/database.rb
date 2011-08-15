<% unless @no_database %>
settings = YAML::load_file("config/db.yml")
<% if @database != 'mongo' %>
# Sequel Configuration
DB = Sequel.connect(ENV['DATABASE_URL'] || settings[ENV['RACK_ENV']])
<% else %>
# MongoMapper Configuration
DB = Mongo::Connection.new
MongoMapper.database = settings[ENV['RACK_ENV']]['name']
<% end %>

<% end %>
<% if @redis %>
# Redis Configuration
if ENV['REDISTOGO_URL']
  require "uri"
  uri = URI.parse(ENV['REDISTOGO_URL'])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  redis_settings = YAML::load_file("config/redis.yml")
  REDIS = Redis.new(redis_settings[ENV['RACK_ENV']])
end
<% end %>
