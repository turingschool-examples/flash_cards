class Deck
  attr_reader :cards, :deck
  def initialize(cards)
    @cards = cards
    @deck = []

        @deck << Card.new('question', 'answer', :category)
  end

def deck
  @deck << @cards
end


    def count
      cards = [@card_1, @card_2, @card_3]
      cards.count

     end
     def cards_in_category(category)
       cards.find_all {|card| card.category == category}


    end


end

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
