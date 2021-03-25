require './lib/game'
require 'pry'

class Round
  attr_accessor :deck,
                :turns,
                :current_card_num,
                :current_card,
                :number_correct,
                :correct_answer_hash

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_num = 0
    @current_card = deck.cards[0]
    @number_correct = 0
    @correct_answer_hash = {}
  end

  def take_turn(guess, game)
    #updates current card as needed
    @current_card = deck.cards[current_card_num]
    #creates new turn object
    new_turn = Turn.new(guess, @current_card)
    # tracks if the response was correct or not
      evaluate_correctness(new_turn)
    #pushes new turn object into turns array
    @turns << new_turn
    #notes that the next turn should start with the next card
    @current_card_num += 1
    #kicks off the turn_message method
    game.message
    #retuns the new Turn object for testing purposes
    return new_turn
  end

      #sub-procedure of take_turn
      def evaluate_correctness(new_turn)
        if new_turn.correct? == true
          @number_correct += 1
        end
      end

  def number_correct_by_category(category)
    num_correct_in_category = turns.find_all do |turn|
      if turn.card.category == category
        turn.correct? == true
      end
    end
    num_correct_in_category.count
  end

  def percent_correct
    (@number_correct.to_f / turns.count) * 100
  end

  def percent_correct_by_category(category)
    num_in_category = turns.find_all do |turn|
      if turn.card.category == category
        turn.correct? == true
      end
    end
    (number_correct_by_category(category).to_f / num_in_category.count) * 100

  end

end
