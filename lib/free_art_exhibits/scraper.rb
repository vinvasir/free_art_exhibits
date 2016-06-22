require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative 'exhibit.rb'

class Scraper
  def get_page
    Nokogiri::HTML(open("http://www.timeout.com/newyork/art/the-best-free-art-exhibitions-in-nyc"))
  end
  
  def scrape_index_page
    page = get_page.css("article.feature-item")
  end
  
  def make_exhibits
      scrape_index_page.each do |exhibit|
          e = Exhibit.new_from_index_page(exhibit)
      end
  end
  
  #First, iterate through the #scrape_index_page method
  #link for venue details: "http://www.timeout.com" + card.css("a.read-more").attr("href").value + "#tab_panel_2" 
  #title and subtitle: card.css("h3 a").text
  #description: card.css("p.feature_item__annotation--truncated")
end

Scraper.new.make_exhibits