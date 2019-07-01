require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'



#create some cards
@card_1 = Card.new("Name the main Charecter in FLCL.", "Naota", :ANIME)
@card_2 = Card.new("Name the robot in FLCL.", "Kanti", :ANIME)
@card_3 = Card.new("Name the protagonist in FLCL.", "Haruko", :ANIME)
@card_4 = Card.new("Who is the Astro Pirate King?", "Atomisk", :ANIME)

#put those cards into a deck
@cards = [@card_1,@card_2,@card_3,@card_4] #first put the cards into an array
@deck = Deck.new([@cards]) #put anime card stack array into new deck obj
@round = Round.new(@deck) #make new round with anime deck


def start(round)


  puts " "
  puts " "
  puts "***F L A S H ***C A R D***G A M E***"
  puts " "
  puts " "
  puts "Welcome! You are playing with 4 cards."
  puts "Good Luck and Enjoy! : ) "
  puts "This is card number 1 out of 4..."
  puts "--------------------------------------"



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


end #end start method

start(@round)
