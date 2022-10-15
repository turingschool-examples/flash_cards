require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

def start
  Round.new(Deck.new(CardGenerator.new("cards.txt").cards))
end

def play_round
  @round = start
  @categories_played = []
  puts "Welcome! You're playing with #{@round.deck.count} cards."

  @round.deck.count.times do
    def play_turn
      puts "-------------------------------------------------"
      puts "This is card number #{1 + @round.turns.count} out of #{@round.deck.count}"
      puts "Question: #{@round.current_card.question}"
      
      unless @categories_played.include?(@round.current_card.category)
        @categories_played << @round.current_card.category
      end

      @round.take_turn(gets.chomp)
      puts @round.turns.last.feedback
    end
    play_turn
  end
  
  def results
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.count} for a total score of #{@round.percent_correct.to_i}%"

    @categories_played.each do |category_played|
      puts "#{category_played} - #{@round.percent_correct_by_category(category_played).to_i}%"
    end
  end

  results
end
play_round