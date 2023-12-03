
class Deck
  attr_reader :collection_card

  def initialize(collection_card)
    @collection_card = collection_card
  end

  def add_card(card)
    @collection_card << card
  end

  def count
    @collection.card.length
  end

  def cards_in_category(category)
    @collection_card.find_all {|card| card.category == category}
  end
end
