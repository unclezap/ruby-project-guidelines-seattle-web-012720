require 'bundler'
Bundler.require

require_all 'models'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/cards.db'
)

require_all 'lib'

  ActiveRecord::Base.logger = nil

# Dir[File.join(File.dirname(__File__), "../app/models", "*.rb")].each {|j| require j}
