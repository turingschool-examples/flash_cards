require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class Game
  attr_reader :round
  def initialize(file)
    @cards = CardGenerator.new(file).cards
    @round = Round.new(Deck.new(@cards))
  end

  def start
    deck_count = @round.deck.count
    card_counter = 0

    list_of_categories = []

    @round.deck.cards.each do |card|
      if !list_of_categories.include?(card.category)
        list_of_categories << card.category
      end
    end

    puts "-" * 40
    puts "Welcome! You're playing with #{deck_count} cards."


    while @round.deck.cards.size > 0
      card_counter += 1
      puts "-" * 40
      puts "This is card number #{card_counter} out of #{deck_count}."

      puts "Question: #{@round.current_card.question}"
      input = gets.chomp
      current_turn = @round.take_turn(input)
      puts current_turn.feedback
    end

    puts "************* Game over! ***************"
    puts "You had #{@round.number_correct.to_i} correct guesses out of #{deck_count} for a total score of #{'%.2f' % @round.percent_correct}%."
    list_of_categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end
