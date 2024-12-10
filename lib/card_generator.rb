# card_generator.rb - defines the CardGenerator class (loading from text file to generate cards)

require './lib/card.rb'

class CardGenerator 
    #I don't like this; shouldn't need to have a member variable referring to the same cards as the deck.  But for now, leave it I guess
    #(in part to stay compliant with requirements)
    attr_reader :cards

    #NOTE: I feel weird having a class which only initializes.  Seems to be there for the sake of being there - why not an isolated method?

    def initialize(default_filename)
        #Read data from text file provided and construct card array
        #Then associate card array with deck

        #NOTE: seems like this method will be the bulk of this class, unless I break it up further...
        @cards = []

        #I'm guessing I need to open a file, then read line-by-line until lines no longer exist (EOF?).
        #Sounds like a job for .each or something simliar if possible

        #There are multiple ways to read from a file, each through the File class.  Is one best?
        #Approach #1: read the whole file into a single string.  Quick single call, but then lots of parsing the string required
        # full_data_string = File.read("card_data.txt")
        #Approach #2: open the file, then read line by line via readline() or gets().  This is what I'll try for now
        #Approach #3: other methods and/or parsing approaches.  What is optimal?

        #Let's go with approach #2:
        #I've also added a more flexible loading process...
        file = open_data_file(default_filename)
        puts "Card information loaded.  Let's go!\n"

        #NOTE: don't forget to add comment=ignoring read functionality for text file (so I can add comments there)


        #There are other ways to do this, no doubt, but this seems to work.
        #NOTE: gets() returns nil at end of file (EOF), but .readline() DOES NOT!  (Why???)
        while (new_line = file.gets) != nil
            # substrings = new_line.split(",")

            question_string = (new_line.split(",")[0]).strip
            answer_string = (new_line.split(",")[1]).strip
            category = (new_line.split(",")[2]).strip.to_sym     #Needs to be a symbol to be compliant with other code/requirements

            new_card = Card.new(question_string, answer_string, category)
            @cards << new_card
        end

        #May need to convert String -> symbol here... (or re-write the earlier iterations code)
        # card_array << new_card

        # return card_array
    end

    def open_data_file(default_filename)
        
        user_input_filename = ""

        loop do
            puts "Please type the file holding all card information, or press [enter] for default:"
            user_input_filename = gets

            if user_input_filename.chomp == ''          #Seems some invisible chars (more than just '\n') were present
                user_input_filename = default_filename
            end
            
            if File.exist?(user_input_filename.chomp) == true
                #Important: Need to use the exist?() method here, as open() with invalid path throws an error and I believe halts execution entirely.
                break
            else
                puts user_input_filename
                puts "File does not exist.  Let's try this again."
            end
        end

        # while File.exists?(user_input_filename = gets()) == false
            
        #     puts "File does not exist.  Let's try this again."
        # end

        return File.open(user_input_filename.chomp, 'r')         #Return the file object
    end

end