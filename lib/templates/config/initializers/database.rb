<% unless @no_database -%>
settings = YAML::load_file("config/db.yml")
<% if @database != 'mongo' -%>
# Sequel Configuration
DB = Sequel.connect(<% if !@no_heroku %>ENV['DATABASE_URL'] || <% end %>settings[ENV['RACK_ENV']])
<% else -%>
# MongoMapper Configuration
<% if !@no_heroku -%>
settings[ENV['RACK_ENV']]["uri"] = ENV['MONGOLAB_URI']
<% end -%>
MongoMapper.config = settings
MongoMapper.connect(ENV['RACK_ENV'])
<% end -%>

<% end -%>
<% if @redis -%>
# Redis Configuration
if ENV['REDISTOGO_URL']
require "uri"
uri = URI.parse(ENV['REDISTOGO_URL'])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
redis_settings = YAML::load_file("config/redis.yml")
REDIS = Redis.new(redis_settings[ENV['RACK_ENV']])
end
<% end -%>

