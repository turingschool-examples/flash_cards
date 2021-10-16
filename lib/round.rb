class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.correct?
        category == turn.card.category
      end
    end
  end

  def percent_correct
    (number_correct.to_f / turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / number_correct.to_f) * 100
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    puts "-------------------------------------------------"

    puts "This is card number #{} out of 4."
    puts "Question: #{current_card.question}"
  end
end






