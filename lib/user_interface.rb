require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'
require './lib/card_generator.rb'

class UserInterface
  def initialize(filepath = "./cards.txt")
    @cards = CardGenerator.new(filepath).cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @number_of_cards = @deck.count
    @welcome_message = "Welcome! You're playing with #{@number_of_cards} cards.\n---------------------------------------------------"
    @turn_number = 1
  end
  def play_game
    puts @welcome_message

    while @turn_number <= @number_of_cards
      do_turn()
    end

    finish_game()
  end

  def do_turn
    puts "This is card number #{@turn_number} out of #{@number_of_cards}"

    puts @round.current_card.question
    turn = @round.take_turn(gets.chomp)

    puts turn.feedback
    puts ""
    @turn_number += 1
  end

  def finish_game()
    puts "********** Game over! **********"
    puts "You had #{@round.number_correct} out of #{@number_of_cards} for a total score of #{@round.percent_correct}%."
    @round.categories_in_deck.each do |category|
      puts "#{category.to_s} - #{@round.percent_correct_by_category(category)}% correct."
    end
  end
end
