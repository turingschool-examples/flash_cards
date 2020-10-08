class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end
  
  # def advance_card
  #   require 'pry'; binding.pry
  #   @deck.cards.rotate!
  # end
  
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    # require 'pry'; binding.pry
    # advance_card
    @deck.cards.rotate!
    new_turn
  end

  def correct_answers
   correct_answers = []
    @turns.each do |turn|
      if turn.correct?
       correct_answers << turn
      end
    end
   correct_answers
  end

  def number_correct
    # correct_answers = []
    # @turns.each do |turn|
    #   if turn.correct?
    #     correct_answers << turn
    #   end
    # end
   correct_answers.count
  end

  def number_correct_by_category(category)
    correct_by_category = []
    correct_answers.each do |answer|
      if answer.card.category == category
        correct_by_category << answer
      end
    end
    correct_by_category.count
  end

  def percent_correct
    ((number_correct / @turns.count.to_f) * 100)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category) / number_correct.to_f) * 100)
  end
end