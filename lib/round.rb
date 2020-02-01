class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    @turns.select { |turn| turn.correct? == true}.size
  end

  def number_correct_by_category(category)
    @turns.select { |turn|  turn.card.category == category && turn.correct? == true}.size
  end

  def percent_correct
    ((number_correct.to_f / @turns.size) * 100.00).round(2)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f / @deck.cards_in_category(category).size) * 100.00).round(2)
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"

    while (@turns.count !=  @deck.count)
      puts "This is card number #{@turns.size + 1} out of #{@deck.count}."
      puts "Question: #{current_card.question}"
      answer = gets.chomp
      take_turn(answer)
      puts @turns.last.feedback
    end
    summary
  end

  def summary
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct #{number_correct == 1 ? "guess" : "guesses" } out of #{deck.cards.size} for a total score of #{percent_correct.round(0)}%."
    summary_percentage = {}
    @deck.cards.each { | value | summary_percentage[value.category] = percent_correct_by_category(value.category)}
    summary_percentage.each do | category, percent_correct_by_category |
      puts "#{category.to_s} - #{percent_correct_by_category.round(0)}% correct"
    end
  end
end
