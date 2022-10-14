require './lib/deck'

require './lib/round'

require './lib/card_generator'

class Game
  attr_reader :cards, :deck, :round, :round_count, :categories_played
  def initialize(input_file)
    @input_file = input_file
    @cards = CardGenerator.new(@input_file).cards_inputted
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @round_count = round.deck.count
    @categories_played = []
  end

  def start
    puts "Welcome! You are playing with #{round.deck.count} cards."
    puts '--------------------------------------------------'
    game_take_turn
  end

  def game_take_turn
    round.deck.count.times do
      puts "This is card number #{round.card_number} out of #{round.deck.count}."
      puts "Question: #{round.current_card.question}"

      unless @categories_played.include?(round.current_card.category)

        @categories_played << round.current_card.category
      end
    
      round.take_turn(gets.chomp)
      puts round.turns.last.feedback
    end
    game_over
  end
  
  def game_over
    puts '****** Game over! ******'
    puts "You had #{round.number_correct.to_i} guesses out of #{round_count.to_i} for a total score of #{round.percent_correct.to_i}%."


  
    @categories_played.each do |category_played|
      puts "#{category_played} - #{round.percent_correct_by_category(category_played)}% correct."
    end

  end
end

game = Game.new("./cards.txt")

game.start


