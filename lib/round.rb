class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @turns_correct = [] #subset of turns array
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
      if guess == current_card.answer
        @turns_correct << turn
        # require "pry"; binding.pry
      end
      # require "pry"; binding.pry
    @deck.cards.rotate! # last card is now first card
    return turn

  end

  def number_correct
    @turns_correct.size
  end

  def number_correct_by_category(category)
    @turns_correct.select do |correct_turn|
      category == correct_turn.card.category
    end.size
  end

  def percent_correct
    @turns_correct.size.to_f / @turns.size * 100
    # require "pry"; binding.pry
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) / @deck.cards_in_category(category).size.to_f * 100.0
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.size} cards."
    puts "-------------------------------------------------"

    until @turns.length == @deck.cards.size do #until you have completed as many Turns as you have Cards in the Deck
      puts "This is card number #{@turns.length + 1} out of #{@deck.cards.size}."
      puts "#{@deck.cards.first.question}"
      user_turn = gets.chomp
      user_guess = take_turn(user_turn)
      system("clear")
      puts "That is #{user_guess.feedback}"
    end
  end
end
