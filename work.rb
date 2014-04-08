require 'mechanize'
require 'mongo_mapper'
require 'yaml'
require 'abstract'

module ISICrawler

  Dir["./isi_crawler/models/*.rb"].each {|file| require file }
  Dir["./isi_crawler/models/parser/*.rb"].each {|file| require file }
  Dir["./config/initializers/*.rb"].each {|file| require file }

  module_function
  def search_form
    if @search_form.nil?
      agent = Mechanize.new
      search_page = agent.get('http://isiknowledge.com/?DestApp=WOS')
      @search_form = search_page.form_with(:name => 'WOS_GeneralSearch_input_form')
    end
    @search_form
  end

  def search(title)
    form = search_form
    form['value(input1)'] = "\"" + title + "\""
    result = form.submit()
    num_link = result.search('//*[@id="RECORD_1"]/div[4]/div/a') # XPath of result link
    num_link.text
  end

end
