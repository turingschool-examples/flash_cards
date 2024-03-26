# require './lib/card.rb'

class CardGenerator
    attr_reader :cards

    initialize(filepath)
        @cards = []
        @filepath = filepath
    end

    def create_cards(filepath)
        content = File.open(filepath) do |card_data_line|
        card_data_line.readlines
        end

        content.each {|line| line
        @cards << line.chomp.split(",")}
    end
end
# puts @cards.inspect

filepath = "/Users/cheelee/turing_work/1mod/week1/flashcards_project/flash_cards/lib/cards.txt"