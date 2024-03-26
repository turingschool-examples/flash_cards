# require './lib/card.rb'

class CardGenerator
    attr_reader :cards

    def initialize
        @cards = []
    end

    def create_cards(filepath)
        content = File.open(filepath) do |card_data_line|
        card_data_line.readlines
        end

        content.each {|line|
        @cards << line.split(",")}

        @cards.each {|card| card[-1].chomp!}
    end
end
# puts @cards.inspect

filepath = "/Users/cheelee/turing_work/1mod/week1/flashcards_project/flash_cards/lib/cards.txt"

generator = CardGenerator.new

some_cards = generator.create_cards(filepath)

puts some_cards.inspect