
class GameStart
  attr_reader :cards,
              :deck,
              :round

  def initialize(cards, deck, round)
    @cards  = []
    @deck   = Deck.new(cards)
    @round  = Round.new(deck)
  end

  def start(cards, deck, round)
    welcome_message
    play_through_deck
    game_over_message 
  end

  def welcome_message
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
  end

  def play_through_deck
    while round.turns.length < deck.count 
      turn_number = round.turns.length + 1
    
      puts "This is card number #{turn_number} out of #{deck.count} cards."
      puts "Question: #{round.current_card.question}"
      print '> '
      
      user_input = gets.chomp
      new_turn = round.take_turn(user_input)
      puts new_turn.feedback
    end
  end

  def game_over_message
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
    round.category_scores
  end
end