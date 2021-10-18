# Richard Tillies
# October 12, 2021
# Card class
# ~/turing/1module/projects/flash_cards/lib/card_generator.rb


class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
    File.foreach(@filename) do |line|
      parts = line.split(",")
      new_card = Card.new(parts[0], parts[1], (parts[2].chomp))
      puts new_card.question
      puts new_card.answer
      puts new_card.category

      @cards << new_card
    end
    @deck = Deck.new(@cards)
  end
end
