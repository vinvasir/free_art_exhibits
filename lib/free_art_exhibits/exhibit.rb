require 'pry'

class Exhibit
    attr_accessor :url,:title, :description
    @@all = []
    
    def self.new_from_index_page(exhibit)
      self.new(
          "http://www.timeout.com" + exhibit.css("a.read-more").attr("href").value + "#tab_panel_2",
          exhibit.css("h3 a").text,
          exhibit.css("p.feature_item__annotation--truncated")
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
end