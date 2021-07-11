require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader :card_1,
              :card_2,
              :card_3,
              :card_4,
              :deck,
              :round,
              :begin,
              :user_input

  def initialize
    @card_1 = Card.new("What song does Rosalia do with Bad Bunny?", "La Noche De Anoche", :Musica)
    @card_2 = Card.new("What american rapper did Bad Bunny collab with in 2018?", "Drake" , :Musica)
    @card_3 = Card.new("What round purple fruit is highly toxic to dogs?", "grapes", :Dogs)
    @card_4 = Card.new("What plant is the main ingredient in tequila?", "Agave", :Alcohol)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
    @begin = 0
    @user_input = user_input
  end

  def start
    @begin = deck.count
    beginning
    play_game
    final_message
  end

  def beginning
   puts line
   puts welcome_message
   puts card_quantity
   puts quit_message
   puts line
 end

 def line

 end

 def welcome_message

 end

 def card_quantity

 end

 def quit_message
 end

 def trivia

 end

 def feedback

 end

 def card_number

 end

 def play_game
   while round.deck.cards.empty? != true
       puts card_number
       puts trivia
       print "> "
       @user_input = $stdin.gets.chomp.downcase
       puts feedback
       round.take_turn(@user_input)
       puts line
       break if @user_input == "q"
     end
   end

   def final_message

   end



end


game1 = Game.new
game1.start
