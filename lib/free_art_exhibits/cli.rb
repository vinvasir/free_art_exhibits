class FreeArtExhibits::CLI
    def call
       FreeArtExhibits::Scraper.new.make_exhibits
       puts "Here are some free art exhibits according to Timeout New York"
       start
    end
   
    def start
        puts "What exhibit number range would you like to see? Please enter 1 for 1-5 or 6 for 6-10"
        input = gets.strip.to_i
        print_exhibits(input)
        
        puts "Which number exhibit would you like more info on?"
        input = gets.strip.to_i
        exhibit = FreeArtExhibits::Exhibit.find(input)
        print_exhibit(exhibit)
        puts ""
        
        puts "Would you like to see another exhibit? Enter Y or N"
        
        input = gets.strip.downcase
        if input == "y"
            start
        else
            puts ""
            puts "Thankyou! Have a great day!"
            exit
        end       
    end
   
    def print_exhibit(exhibit)
        puts ""
        puts "----------- #{exhibit.title}"
        puts ""
        puts "Description:           #{exhibit.description}"
        puts ""
        puts ""
        puts "Website:            #{exhibit.url}" 
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Venue:              #{exhibit.venue_name}"
        puts ""
        puts ""
        puts "Address:            #{exhibit.address}"
        puts ""
        puts ""
        puts "Opening Hours:       #{exhibit.opening_hours}"
    end
    
  def print_exhibits(from_number)
    puts ""
    puts "---------- Exhibits #{from_number} - #{from_number+4} ----------"
    puts ""
    FreeArtExhibits::Exhibit.all[from_number-1, 5].each.with_index(from_number) do |exhibit, index|
      puts "#{index}. #{exhibit.title} - #{exhibit.url}"
    end  
  end     
end
