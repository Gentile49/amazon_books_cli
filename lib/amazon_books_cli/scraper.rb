require "pry"
require "nokogiri"
require "open-uri"
class AmazonBooksCli::Scraper

  attr_accessor :arrayOfBooks, :doc, :description, :link, :docs
  def initialize
    @arrayOfBooks = []
    @description = []
    @link = nil
  end
  def scrapeBooks

    @doc = Nokogiri::HTML(open('https://www.alibris.com/booksearch?keyword=david+foster+wallace+&mtype=B&hs.x=0&hs.y=0&hs=Submit'
    ))

    @doc.css('h2').each do |file|
       @arrayOfBooks << file.text.strip
    end
    @arrayOfBooks
  end
  def scrapeLinks(selection)
    @link = @doc.css('.synopsis .left a').map {|link| link['href']}
    @link = @link[selection]
  end
  def scrapeDetail(selection)
    self.scrapeLinks(selection)
    @docs = Nokogiri::HTML(open("https://www.alibris.com#{@link}"))
    synopsis = @docs.css("#synopsis-detail").text.strip



  end
end
