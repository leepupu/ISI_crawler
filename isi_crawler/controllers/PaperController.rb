require 'mechanize'
require 'mongo_mapper'
require 'yaml'
require 'date'

class PaperController
  def initialize
    agent = Mechanize.new
    search_page = agent.get('http://isiknowledge.com/?DestApp=WOS')
    @search_form = search_page.form_with(:name => 'WOS_GeneralSearch_input_form')
  end

  def run
    #TODO: slice time, multi thread?, batch data
  end

  def batch(start_date, end_date)
    #TODO: grap data in date range by build
  end

  def build(html)
    #TODO: build Paper by html
  end

end
