require "pry"
require "nokogiri"
class AmazonBooksCli::Scraper

  

  def scrape

    doc = Nokogiri::HTML(open('https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=david+foster+wallace+'
    ))

    doc.css('a .a-size-small .a-link-normal').text
    binding.pry
  end
end
