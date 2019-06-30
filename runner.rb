require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'



#create some cards
<<<<<<< HEAD
@card_1 = Card.new("Name the main Charecter in FLCL.", "Naota", :ANIME)
@card_2 = Card.new("Name the robot in FLCL.", "Kanti", :ANIME)
@card_3 = Card.new("Name the protagonist in FLCL.", "Haruko", :ANIME)
@card_4 = Card.new("Who is the Astro Pirate King?", "Atomisk", :ANIME)

#put those cards into a deck
@cards = [@card_1,@card_2,@card_3,@card_4] #first put the cards into an array
@deck = Deck.new([@cards]) #put anime card stack array into new deck obj
@round = Round.new(@deck) #make new round with anime deck

def start
=======
card_1 = Card.new("Name the main Charecter in FLCL.", "Naota", :ANIME)
card_2 = Card.new("Name the robot in FLCL.", "Kanti", :ANIME)
card_3 = Card.new("Name the protagonist in FLCL.", "Haruko", :ANIME)
card_4 = Card.new("Who is the Astro Pirate King?", "Atomisk", :ANIME)

#put those cards into a deck
@card_stack_anime = [card_1,card_2,card_3,card_4] #first put the cards into an array
@anime_deck = Deck.new([card_stack_anime]) #put anime card stack array into new deck obj
@new_round = Round.new(anime_deck) #make new round with anime deck

def start(round)
>>>>>>> 5d2baf7f1c4949e649cc3d074294cadb67c60155

  puts " "
  puts " "
  puts "***F L A S H ***C A R D***G A M E***"
  puts " "
  puts " "
  puts "Welcome! You are playing with 4 cards."
  puts "Good Luck and Enjoy! : ) "
  puts "This is card number 1 out of 4..."
  puts "--------------------------------------"

<<<<<<< HEAD

    @cards.each do |card| #iterates through cards
    puts "Question: #{card.question}"
    puts "Type your guess -> "
    @guess = gets.chomp.capitalize
    @round.take_turn(@guess)
    puts @round.turns.last
  end

puts " "
puts " "

puts "*** G A M E O V E R ***"
puts "You had #{@round.amount_correct} correct answers out of #{@deck.count} for a total score of #{@round.percent_correct}%!"


end #end start method



start #calls start method
=======
  @round.deck.each do |card|
    puts "Question: #{@card.question}"
    puts "Type your answer -> "
    @guess = gets.chomp #gets user answer
    @round.take_turn(guess)
    puts round.turns.last.feedback
  end
end

start(new_round) #calls start method
>>>>>>> 5d2baf7f1c4949e649cc3d074294cadb67c60155
