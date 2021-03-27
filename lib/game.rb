class Game
  attr_reader :round
  def initialize(round)
    @round = round
  end

  def start
    puts "Welcome! You're playing with #{number_of_cards} cards."
    puts "-------------------------------------------------"
    #loop
    @round.deck.cards.length.times do
      puts "This is question #{@round.turns.length + 1} out of #{number_of_cards}."
      
    end

      #print stats
  end

  def number_of_cards
    @round.deck.cards.length
  end
end
