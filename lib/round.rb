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
    correct_answer = []
    @turns.each do |turn|
      if turn.correct? == true
        correct_answer << turn
      end
    end
    correct_answer.length
  end

  def number_correct_by_category(category)
    @turns.select do |turn|
      turn.card.category == category && turn.correct? == true
    end.length
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / @deck.cards_in_a_category(category).length.to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-" * 49
    puts "This is card #{@turns.length.to_i} out of 4"
    puts "#{current_card.question}"
    gets.chomp
    puts """
    ****** Game Over ******
    You had #{number_correct} guesses out of 4 for a total score of #{percent_correct}%.
    STEM - #{percent_correct_by_category(:STEM)}% correct
    Turing Staff - #{percent_correct_by_category(:Turing_Staff)}% correct
    Pop Culture - #{percent_correct_by_category(:Pop_Culture)}% correct
    """
  end
end
