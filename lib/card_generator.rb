class CardGenerator
    # Initialize filename instance variable
    def initialize(filename)
        @filename = filename
    end

    # Define method to create cards from .txt file
    def cards
        # Initialize an array in which to store cards
        card_array = Array.new

        # Open the given file and parse lines into an array
        file = File.open(@filename)
        lines = file.readlines

        # For each line, split question, answer, and category by commas,
        # create new card, and add that card to the array
        lines.each do |line|
            card = Card.new(line.split(",")[0], line.split(",")[1], line.split(",")[2].chomp)
            card_array.push(card)
        end

        # Output the card array
        card_array
    end
end
