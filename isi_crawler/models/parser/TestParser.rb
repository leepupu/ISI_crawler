class TestParser < Parser
  def initialize(paper)
    super
    #set this parser is responsable for what field
    paper.class.key :testField, String
  end

  def parse(html)
    paper.testField = 'testing'
  end
end
