class AmazonBooksCli::Book
  attr_accessor :wigit

  def initialize
    @wigit = AmazonBooksCli::Scraper.new
  end

  def bookList
    @wigit.scrapeBooks
  end

  def bookDetail(selection)
    @wigit.scrapeDetail(selection)
  end

end
