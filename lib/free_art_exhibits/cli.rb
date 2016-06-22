require_relative 'scraper.rb'
require_relative 'exhibit.rb'

class CLI
   def call
       Scraper.new.make_exhibits
       puts "Here are some free art exhibits according to Timeout New York"
       start
   end
   
   def start
       puts "What exhibit number would you like to see? Please enter a number from 1 to 10"
       input = gets.strip.to_i
       exhibit = Exhibit.find(input)
       print_exhibit(exhibit)
   end
   
    def print_exhibit(exhibit)
        puts ""
        puts "----------- #{exhibit.title}"
        puts ""
        puts "Description:           #{exhibit.description}"
        puts ""
        puts ""
        puts "Website:            #{exhibit.url}" 
    end
end

CLI.new.call