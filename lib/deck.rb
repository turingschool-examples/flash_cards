class Deck
  attr_reader :card, :category

  def initialize (card, category)
    @card = []
    @category = category
  end
end
