class Round
  attr_reader :deck, :turns, :correct

  def initialize(deck)
    @turns = []
    @correct = 0
    @deck = deck
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns << new_turn
    if new_turn.correct?
      @correct += 1
    end
    new_turn
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.correct? && turn.card.category == category
        turn.card.category
      end
    end
  end

  def percent_correct
     number_correct.to_f / @turns.count * 100
  end

  def percent_correct_by_category(category)
    total_in_category = 0
    @turns.count do |card|
      if category == card.card.category
        total_in_category += 1
      end
    end
    number_correct_by_category(category).to_f / total_in_category * 100
  end

  def start
    total_cards = turns.count + deck.cards.count
    total_rounds = deck.cards + turns

    categories = deck.cards.map do |card|
      card.category
    end.uniq

    puts "Welcome! You're playing with #{total_cards} cards."
    puts '-' * 51

    num = 0
    total_rounds.each do |card|
      puts "This card is number #{num += 1} out of #{total_cards}"
      puts "Question: #{card.question}"
      user_answer = gets.chomp
      guess = take_turn(user_answer)
      puts guess.feedback
    end

    puts "****** Game Over! ******"
    puts "You had #{correct} correct guesses out of #{total_cards} for a total score of #{(percent_correct).to_i}%"
    categories.each do |category|
      puts "#{category} - #{(percent_correct_by_category(category).to_i)}%"
    end
  end
end
