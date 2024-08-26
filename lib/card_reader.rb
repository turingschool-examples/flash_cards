require 'pry'

class Card_reader

  def initialize(deck_file)
    @deck_file = File.read(deck_file)
    @cards = []
  end

  def create_deck()
    cards_as_string = @deck_file.split('\n')
    cards_as_string.each do |card_as_string|
      card_as_array = card_as_string.split(',')
      card = Card.new(card_as_array[0],card_as_array[1],card_as_array[2].intern)
      @cards << card
    end
    deck = Deck.new(@cards)
    deck
  end

end
# myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# myCard4 = Card.new("What is objectively the best rodent?", "Capybara", :STEM)

# cards = [myCard1,myCard2,myCard3,myCard4]

# deck1 = Deck.new(cards)
