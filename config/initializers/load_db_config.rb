PRIMARY_DB_CONFIG = YAML.load_file("#{Rails.root}/config/db.yml")[Rails.env]

# As our secondary db is being defined in production_sec.
SECONDARY_DB_CONFIG = YAML.load_file("#{Rails.root}/config/db.yml")[Rails.env+
                                                                        '_sec']