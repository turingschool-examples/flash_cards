require 'csv'

class CardGenerator
    # Initialize filename instance variable
    def initialize(filename)
        @filename = filename
    end

    # Define method to create cards from .txt file
    def cards
        # Initialize an array in which to store cards
        card_array = []

        # Parse lines from csv into an array (if no commas used in the question)
        lines = CSV.read(@filename)

        # For each line, split question, answer, and category by commas,
        # create new card, and add that card to the array
        lines.each do |line|
            if line[2].split.length == 1
                # Convert category to symbol if only one word
                card = Card.new(line[0], line[1], line[2].to_sym)
            else
                # If category is two words, leave as a string
                card = Card.new(line[0], line[1], line[2])
            end
            card_array.push(card)
        end

        # Output the card array
        card_array
    end
end
