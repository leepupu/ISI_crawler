class Parser
  attr_accessor :paper
  def initialize(paper)
    @paper = paper
    # paper.key :testField, String
  end

  def parse(html)
    not_implemented
  end
end
