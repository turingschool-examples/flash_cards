require './lib/card'
require './lib/turn'
require './lib/deck'

class Round

  attr_reader :deck, :turns, :count

    def initialize(deck)
      @deck = deck
      @turns = []
      @count = 0
    end

    # return the number of cards in a deck
    def current_card
      @deck.cards[count]
    end

    # creates a new turn (has a guess, has the current card)
    # stores the turn into the @turns array
    # updates @count - the current number of turns
    # returns a Turn object
    def take_turn(guess)
      turn = Turn.new(guess, current_card)
      @turns << turn
      @count += 1
      turn
    end

    # create a counter for the number of correct turns
    # run through the @turns array and determine if each turn is correct
    # update the counter for the number of correct turns for each turn correct
    # return the integer value for the number of correct turns
    def number_correct
      count_of_correct_turns = 0

      @turns.each do |turn|
        if turn.correct? == true
          count_of_correct_turns += 1
        end
      end
        count_of_correct_turns
    end

    # create a counter for the number of correct turns by each category
    # if a turn is correct and that turns category matches the category passed in
    # update the counter
    # return the integer value for the number correct by category
    def number_correct_by_category(category)
      correct_count = 0
      @turns.each do |turn|
        if turn.correct? == true && turn.card.category == category
          correct_count = correct_count + 1
        end
      end
      correct_count
    end

    # determine the total percentage of the round
    # Divide the number of correct turns by the total number of cards in the deck
    # turn the integers into floats then multiply by 100 to get the total percent
    # return the float value for the percentage
    def percent_correct
      division_to_integer  = (number_correct.to_f / @count)
      ((number_correct.to_f / @count) * 100).to_i
    end

    # determine the percent correct by the category passed in
    # if there are no cards of that category in that deck, return a float of 0.0
    # divide the number correct in that category by the total cards in that category
    # multiply by 100 to get a percentage, then change integer to a float
    # return a float value for the percent correct in that category
    def percent_correct_by_category(category)
      if deck.cards_in_category(category).length == 0
        return 0.0
      end
      ((number_correct_by_category(category) / deck.cards_in_category(category).length) * 100).to_f
    end
end
