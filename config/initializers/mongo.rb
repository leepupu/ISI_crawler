config = YAML.load_file './config/mongo.yml'

MongoMapper.connection = Mongo::Connection.new(config["host"], config["port"])
MongoMapper.database = config["database"]
puts 'mongo loaded'
