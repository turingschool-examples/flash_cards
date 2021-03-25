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

  def take_turn(guess)
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
    #retuns the new Turn object for testing purposes
    return new_turn
  end

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

# Struck from take_turn
# #adds correct answers to correct_answer_hash & total number_correct count
#   if guess == @current_card.answer
#   @number_correct += 1
# # require "pry"; binding.pry
#   if @correct_answer_hash.include? (@current_card.category)
#     @correct_answer_hash[@current_card.category] = @correct_answer_hash.value += 1
#   else
#     @correct_answer_hash[@current_card.category] = 1
#   end
# #flips current card to next card
#   @current_card_num += 1
#   @current_card = deck.cards[@current_card_num]
#   #creates a new Turn instance

#  require "pry"; binding.pry
