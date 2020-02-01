class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    @turns.count {|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    (100.0 * number_correct / @turns.length).round(2)
  end

  def percent_correct_by_category(category)
    (100.0 * number_correct_by_category(category) / @turns.count {|turn| turn.card.category == category}).round(2)
  end

  def start
    p "Welcome! You're playing with #{deck.count} cards."
    p "-------------------------------------------------"

    until turns.length == deck.count do
      p "This is card number #{turns.length + 1} out of #{@deck.count}."
      p "Question: #{current_card.question}"

      guess = gets.chomp
      turn = take_turn(guess)
      p turn.feedback
    end

    p "****** Game over! ******"
    p "You had #{number_correct} correct guesses out of #{@deck.count} for a total score of #{percent_correct}%."

    categories =  @deck.cards.map.with_index do |item, index|
      @deck.cards[index].category
    end

    categories.uniq!

    categories.each do |category|
      p "#{category.to_s} - #{percent_correct_by_category(category)}% correct"
    end
  end

end
