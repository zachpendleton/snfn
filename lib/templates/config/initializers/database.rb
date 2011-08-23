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

