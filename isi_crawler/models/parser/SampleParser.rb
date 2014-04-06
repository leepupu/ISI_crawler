class SampleParser < Parser
  def initialize(paper)
    super
    #set this parser is responsable for what field
    paper.class.key :sample_field, String
  end

  def parse(html)
    # this method should get data from html param
    paper.sample_field = 'testing'
  end
end
