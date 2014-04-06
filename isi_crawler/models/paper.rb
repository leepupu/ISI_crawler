class Paper
  include MongoMapper::Document
  attr_accessor :parsers
  key :created_at, Time
  key :updated_at, Time

  def initialize
    load_parsers
  end

  def load_parsers
    config = YAML.load_file './config/paper.yaml'
    @parsers = []
    config["parsers"].each do |parser|
      @parsers << parser.constantize.new(self)
    end
  end

  def parse(html)
    @parsers.each {|parser| parser.parse(html)}
    self.created_at = Time.now if self.created_at.blank?
    self.updated_at = Time.now
  end

end
