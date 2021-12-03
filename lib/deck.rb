class Deck
  attr_reader :deck, :cards
  def initialize(cards)
    @cards = cards
    @count = 0

  end

  def add(card_to_add)
    @cards << card_to_add
  end

  def contents()
    puts @cards
  end

  def count
    @count = @cards.count
  end
  # def fetch_category
  #   return cards(2)
  # end

  def cards_in_category(category)
    my_cards = []
    @cards.each do |card|
      if card.category == category
        my_cards << card
      end
    end
    my_cards
    # @cards.select{|look_for| card.category == look_for}
# binding.pry
  end
end

#binding.pry
