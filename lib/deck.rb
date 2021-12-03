class Deck
  attr_reader :deck, :cards

  def initialize(cards)
    @cards = []
  end

  def deck(cards)
    for card in cards
      @cards << card
    end
  end

  def cards_in_deck
    @cards
  end

  def count
    @cards.count()
  end

  stem = []
  geography = []
  pop_culture = []


  def cards_in_category(category)
    if @cards.at(2) == (:STEM)
      stem.push(category)
    elsif @cards.at(2) == (:Geography)
      geography.push(category)
    else @cards.at(2) == ("Pop Culture")
      pop_culture.push(category)
    end
  end
end
