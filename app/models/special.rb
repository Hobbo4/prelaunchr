class AccessLog < ActiveRecord::Base
  establish_connection "log_database_production"
end