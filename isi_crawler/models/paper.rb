class Paper
  include MongoMapper::Document
  attr_accessor :parsers
  key :created_at, Time
  key :updated_at, Time

  def initialize
    load_parsers
  end

  def load_parsers
    @parsers = []
    Paper.configuration.parsers.each do |parser|
      @parsers << parser.constantize.new(self)
    end
  end

  def parse(html)
    @parsers.each {|parser| parser.parse(html)}
    self.created_at = Time.now if self.created_at.blank?
    self.updated_at = Time.now
  end

  class << self
    attr_accessor :configuration
    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :parsers
    def initialize
      @parsers = []
    end
  end
end
