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
  
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
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
   correct_answers.count
  end
  
  def number_correct_by_category(category)
    correct_by_category = []
    all_category_questions(category).each do |answer|
      if answer.correct? 
        correct_by_category << answer
      end
    end
    correct_by_category.count
  end
  
  def all_category_questions(category)
    @turns.find_all do |turn|
      if turn.card.category == category
      turn
      end
    end
  end

  def percent_correct
    ((number_correct / @turns.count.to_f) * 100)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category) / all_category_questions(category).count.to_f) * 100)
  end
end