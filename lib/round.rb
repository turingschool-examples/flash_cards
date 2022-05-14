class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!(1)
    @turns.last
  end

  def number_correct
    @turns.count{ |turn| turn.correct?}
  end

  def number_correct_by_category(category)
    @turns.count{ |turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / @deck.cards_in_a_category(category).length.to_f) * 100
  end

  def start
  counter = 1
  categories = []
  puts "Welcome! You're playing with #{deck.count} cards."

  until @turns.length == deck.count do
    puts "-" * 49
    puts "This is card number #{counter} out of #{deck.count}"
    puts "#{current_card.question}"
    guess = gets.chomp
    puts (take_turn(guess)).feedback
    counter += 1
  end

    puts """
    ****** Game Over ******
    you had #{number_correct} correct guesses out of #{@deck.count} for a total score of #{percent_correct.round(1)}%.
    """
      @deck.cards.each do |card|
        categories << card.category
      end
      categories = categories.uniq
      categories.each do |category|
        puts "#{category} - #{percent_correct_by_category(category).round(1)}% correct"
    end
  end
end
