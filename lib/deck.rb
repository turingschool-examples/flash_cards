class Deck

  attr_reader :cards, :category

  def initialize(cards, category)
    @cards = cards
    @category = category
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    STEMArray = []
    GeographyArray = []
    PopCultureArray = []

    if card.category == :STEM
      STEMArray << card
    elsif card.category == :Geography
      GeographyArray << card
      
  end

end
