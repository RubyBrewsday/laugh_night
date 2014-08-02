module ScraperMethods
  def sanitize_string(string)
    return string.gsub(/\t/, '').gsub(/\r/, '').gsub(/\n/,'')
  end

  def carolines_scraper(pages)
    pages.times do |i|
      doc = Nokogiri::HTML(RestClient.get("http://www.carolines.com/full-schedule/?fsp=#{i+1}"))
      doc.css('.schedul-block').each do |link|
        p link.css('.comedian-page').first["title"]
        p link.css('.comedian-page').first['href']
        p sanitize_string(link.css('.show-date .white').first.content)
        p link.css('.show-date a').first.content
      end
    end
  end

  def comedy_cellar_scraper(pages)
    pages = []
    Nokogiri::HTML(RestClient.get("http://www.comedycellar.com/line-up/")).css('.shows-search-bar').css('option').each do |date|
      pages << sanitize_string(date['value'])
    end
    pages.reverse!
    pages.length.times do |i|
      page = pages.pop
      doc = Nokogiri::HTML(RestClient.get("http://www.comedycellar.com/line-up/?_date=%0D%0A%09%09%09%09%09%09%09#{page}"))
      doc.css(".show").each do |show|
        p sanitize_string(show.css('.show-time').first.content)
        show.css('.comedian-block-desc').each do |comedian|
          p sanitize_string(comedian.css('.comedian-block-desc-name').first.content)
          p comedian.css('a').first['href'] if comedian.css('a').first
        end
      end
    end
  end

  # def standup_ny_scraper
  #   doc = Nokogiri::HTML(RestClient.get("http://www.standupny.com/calendar/"))
  #   month = doc.css(".TM-Calender-currentMonth").first.content.split(' ')[0]
  #   p month
  # end

  def comic_strip_live_scraper
    doc = Nokogiri::HTML(RestClient.get("http://www.comicstriplive.com/index.php/schedule/"))
    doc.css('.smallcal').each do |date|
      p sanitize_string(date.css('.month').first.content + date.css('.big_date').first.content)
      date.css('.description').each do |comedians|
        comedians.css('p').each do |comedian|
          p comedian.content. unless /(.*)0pm(.*)/ =~ comedian.content
        end
      end
    end
  end
end
