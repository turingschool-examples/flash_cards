require 'pry'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end


    # stem = cards.find_all do |stem|
    #     stem == :STEM
    # end
    #
    # geography = cards.find_all do |geography|
    #   geography == :Geography
    # end
    #
    # popculture = cards.find_all do |popculture|
    #   popculture = "Pop Culture"
    # end

  def cards_in_category(category)
    cat_array = []
    @cards.each do |card|
      if card.category == category
        cat_array << card
      # elsif
      #   card.category == :Geography
      #   cat_array << card
      # else
      #   # card.category == "Pop Culture"
      #   cat_array << card
      end
    end
    cat_array
  end

end
