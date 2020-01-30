class Round
  attr_reader :deck, :turns, :number_correct, :flip

  def initialize(deck)
    @deck = deck
    @turns = []
    @flip = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@flip]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @number_correct += 1 if new_turn.feedback == "Correct"
    @turns << new_turn
    @flip += 1
    new_turn
  end

  def number_correct_by_category(category)
    matches = 0

    @turns.each do |turn|
      if turn.card.category == category && turn.feedback == "Correct"
        matches += 1
      end
    end
    matches
  end

  def percent_correct
    p 0 if @number_correct == 0
    (@number_correct.to_f / @turns.length) * 100
  end

  def percent_correct_by_category(category)
    p 0 if @number_correct == 0
    total_category_questions = 0
    
    turns.each {|turn| total_category_questions += 1 if turn.card.category == category}
    (number_correct_by_category(category).to_f / total_category_questions) * 100
  end
end
