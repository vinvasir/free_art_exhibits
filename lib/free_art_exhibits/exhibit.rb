require 'pry'

class FreeArtExhibits::Exhibit
    attr_accessor :url,:title, :description
    @@all = []
    
    def self.new_from_index_page(exhibit)
      self.new(
          "http://www.timeout.com" + exhibit.css("a.read-more").attr("href").value + "#tab_panel_2",
          exhibit.css("h3 a").text,
          exhibit.css("p.feature_item__annotation--truncated").text
          ) 
    end
   
   def initialize(url, title, description)
      @url = url
      @title = title
      @description = description
      @@all << self
   end
   
   def self.all
       @@all
   end
   
   def self.find(id)
      self.all[id-1] 
   end
   
   def venue_name
      self.details_page.css("td a").first.text
   end
   
   def opening_hours
      self.details_page.css("tbody td").select do |cell|
          cell.text if cell.text.include?("pm") || cell.text.include?("am")
      end.first
      binding.pry
   end
   
   def address
       string = "\n"
       self.details_page.css("tr td").select do |cell|
           cell.text + string + cell.css("br").first.text if cell.text.include?("<br>")
       end.first
   end
   
   def details_page
      @details_page ||= Nokogiri::HTML(open(self.url)) 
   end
   
end
