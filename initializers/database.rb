require 'active_record'

configuration = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(configuration[ENV['RACK_ENV']])
