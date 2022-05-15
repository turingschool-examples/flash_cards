class Round
  attr_reader :deck, :turns, :deck_index
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @deck_index = 0
  end

  def current_card
    deck.cards[@deck_index]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if new_turn.correct?

      @number_correct +=1
    end
    @deck_index += 1
    new_turn
  end

  def number_correct
    @number_correct
  end
# require 'pry'; binding.pry
  def number_correct_by_category(category)
    correct_in_category = 0
    turns.each do |turn|
      if turn.correct? && category == turn.card.category
        correct_in_category += 1
      end
    end
    correct_in_category
  end

  def percent_correct
    @number_correct * 100 / turns.count
  end

  def percent_correct_by_category(category)
    number_in_category = 0
    turns.each do |turn|
      if turn.card.category == category
        number_in_category += 1
      end
    end
    number_correct_by_category(category) * 100.0 / number_in_category
  end

  def start
    while deck_index < deck.count
      puts "This is card number #{deck_index + 1} out of #{deck.count}"
      puts "Question: #{current_card.question}"
      puts take_turn(gets.chomp).feedback
    end

  end




end
