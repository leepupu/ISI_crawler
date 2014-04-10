class PaperController
  def initialize
    @agent = Mechanize.new
    search_page = @agent.get('http://isiknowledge.com/?DestApp=WOS')
    @search_form = search_page.form_with(:name => 'WOS_GeneralSearch_input_form')
    @search_form['value(select1)'] = 'AD'
    @search_form['value(input1)'] = 'Natl Cent Univ'
  end

  def run(s_year=2014,e_year=2014)
    #TODO: slice time, multi thread?, batch data
  end

  def batch(year)
    #TODO: grap data in date range by build
    @search_form['startYear'] = year
    @search_form['endYear'] = year
    result = @search_form.submit
    total = result.search('//*[@id="footer_formatted_count"]').text.gsub(',','').to_i
    uri = Addressable::URI.parse(result.search('//*[@id="RECORD_1"]/div[3]/div[1]/div/a')[0]['href'])
    total.times do |i|
      q = uri.query_values
      q['doc'] = i+1
      uri.query_values = q
      puts uri.query
      paper = @agent.get('http://apps.webofknowledge.com/full_record.do?'+uri.query)
      puts paper.search('//*[@class="title"]').text
    end
  end

  def build(html)
    #TODO: build Paper by html, html is search result page
    # => build Paper with paper.show page's html
  end

end
