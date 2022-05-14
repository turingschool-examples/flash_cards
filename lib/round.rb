class Round
  # require 'turn'
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @guess = 0
  end

  def current_card
    return deck.cards[@guess]
  end

  def take_turn(guess)
      turn = Turn.new(guess, current_card)
      @turns << turn
      @guess += 1
      return turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    return correct
  end

  def number_correct_by_category(category)
    correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        correct += 1
      end
    end
    return correct
  end

  def percent_correct
    return number_correct * 100.0 / @guess
  end
  def percent_correct_by_category(category)
    return number_correct_by_category(category) * 100.0 / @deck.cards_in_category(category).length
  end
  def categories_list

    categories_holder = []
    @deck.cards.each do |card|
      categories_holder << card.category
    end
    return categories_holder.uniq

  end

  def start

    puts "Welcome! you're playing with #{@deck.count} cards."
    puts "-"*38
    @deck.count.times do
      puts "This is card #{@turns.length + 1} out of #{@deck.count}."
      puts "Question: #{current_card.question}"
      guess = gets.chomp
      puts take_turn(guess).feedback
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@deck.count} for a total score of #{percent_correct.to_i}%."

    categories_list.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).to_i}% correct"
    end

  end
end
