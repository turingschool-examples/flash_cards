
class Deck
    attr_reader :cards
  def initialize(cards)
      @cards = cards
  end

  def count
    cards.count
  end

  # name a method called cards_in_category
  # add a paramater called category
  # start a loop for each element in an array.
  # method looks for part of string that matches given arg
  # method finds a previously defined category
  # method repeats this process for every element in array
  # method shovels every matching element into an array
  # method returns array of cards that include said category
  # method does not return undefined categories
  # method returns an empty array for undefined categories



  # create method called cards_in_category with an arg.
  # go to the cards array.
  # name the elements inside that array "card".
  # for every element(card), check if given arg
  # matches the element(card)'s attribute(category).
  # return an array with elements that include that
  # given arg.

  def cards_in_category(category_arg)
    cards.filter do |card|
      category_arg == card.category
    end
  end
 end
