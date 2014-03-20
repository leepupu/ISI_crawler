require 'mechanize'

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

f = File.open("testfile/title.txt", "r")
f.each_line do |line|
  p 'search ' + line + '...'
  p 'got ' + search(line)
end