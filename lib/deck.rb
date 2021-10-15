require './lib/card'




class Deck

  attr_reader :cards, :category

  def initialize(cards) #instructions say to initialize with an array.. am I doing it right?
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards_in_category = []
    @cards.each do |card|
      if @category = :STEM
        cards_in_category << card
      end
    cards_in_category
  end
end
