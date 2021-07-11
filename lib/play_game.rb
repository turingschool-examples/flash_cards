require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class PlayGame
  def initialize
    @cards = CardGenerator.new('cards.txt').cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start_game
    begin_game
    game_flow
    end_game
  end

  def begin_game
    @cards
    puts "Welcome!"
    # start 1.0
    puts "You're playing with #{@deck.count} cards."
  end


  def correct_feedback
    ["NICE!", "Good job!", "Love to see it!"]
  end
  def incorrect_feedback
    ["Nah", "Womp womp", "Hate to see it!"]
  end

  def game_flow
    until @round.turn_count == (@deck.cards.count + 1)
      puts "This is card number #{@round.turn_count} out of #{@deck.cards.count}."

      puts "Question: #{@round.current_card.question}"
      @round.take_turn(user_guess)
      puts "#{@round.turns.last.feedback}"
      if @round.turns.last.correct?
        puts correct_feedback.sample
      else
        puts incorrect_feedback.sample
      end
    end
  end

  def user_guess
    gets.chomp
  end

  def end_game
    puts '****** Game over! ******'
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}%."

    categories = @deck.cards.map do |cards|
      cards.category
    end

    categories.uniq.map do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end
