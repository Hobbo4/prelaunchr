class AccessLog < ActiveRecord::Base
  establish_connection "log_database_#{Rails.env}"
end