class Deck
  attr_reader :cards, :used_cards, :categories_in_deck

  def initialize(cards)
    @cards = cards
    @used_cards = []
    @categories_in_deck = categories_in_use
  end

  # Counts number of cards in Deck
  def count
    @cards.count
  end

  # Returns list of unique categories in Deck.
  def categories_in_use
    categories = []
    @cards.each do |card|
      categories << card.category
    end
    return categories.sort.uniq!
  end

  # Accepts argument. Returns number of cards that match the category given in argument
  def cards_in_category(card_category)
    cards_in_category_list = []
    @cards.each do |card|
      cards_in_category_list << card if card.category == (card_category)
    end
    return cards_in_category_list
  end

  # Removes card from deck once used in game.
  # Adds used card to new array for reference later
  def rotate
    @used_cards << @cards.shift
  end

  # Shuffles all cards at start of game
  def shuffle
    @cards.shuffle
  end
end
