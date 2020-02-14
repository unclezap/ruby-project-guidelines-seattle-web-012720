require_relative 'config/environment.rb'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  [:seed]
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  # ActiveRecord::Base.logger = Logger.new(log.txt)
  Pry.start
end

desc 'makes our cards?!?!???'
task :seed do
  # sh 'rm cards.db'
  sh 'ruby seeds.rb'
end


