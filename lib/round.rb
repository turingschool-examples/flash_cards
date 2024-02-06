class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0

  end

  def current_card
    @deck.current_card
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def new_turn
    correct?
  end

  def number_correct
      correct = 0
      @turns.each do |turn|
        if turn.correct? 
        correct += 1
        end
    end
    correct
  end

  def number_correct_by_category(subject)
    correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == subject
      correct += 1
      end
    end
    
    correct % 100
  end

  def perecnt_correct
     number_correct * 100.0 / @turns.count
  end 

  def percent_correct_by_category(category)
    number_correct_by_category * 100.0 / @turns.count
    
  end

  def percent_correct_by_category(subject)
    total_category_turns = @turns.select do |turn| 
      # require 'pry'; binding.pry
      turn.card.category == subject
    end

    correct_turns_category = total_category_turns.select do |turn|
      turn.correct? 
    end

     (correct_turns_category.count.to_f / total_category_turns.count * 100).round(2)

  end
  

end