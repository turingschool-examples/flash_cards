# require 'pry'
# require './lib/turn'
# require './lib/card'
# require './lib/deck'

class Round
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def deck
    @deck
  end

  def turns
    @turns
  end

  def current_card
    # current card points to the top element of the card's Array
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    # It should create a new Turn object with the appropriate guess and Card.
    # use a method that grabs the first item in the array of cards,
    # returns that card, and removes it from the array
    turn_with_guess = Turn.new(guess, @deck.cards.shift)
    # each turn also needs to add a turn to a turns array
    @turns << turn_with_guess
    return turn_with_guess
  end

  def number_correct
    @turns.each do |turn|
      if turn.correct?
        @number_correct += 1
      end
    end
    @number_correct
  end

  def number_correct_by_category(category)
    correct_by_category = 0
    correct_turns = @turns.select do |turn|
      turn.correct?
    end
    correct_turns.each do |turn|
      if turn.card.category == category
        correct_by_category +=1
      end
    end
    correct_by_category
  end
end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
# card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)
# card_deck = [card_1, card_2, card_3, card_4, card_5]
#
# deck = Deck.new(card_deck)
# start_deck = Deck.new(card_deck)
#
# round = Round.new(start_deck)
# binding.pry
