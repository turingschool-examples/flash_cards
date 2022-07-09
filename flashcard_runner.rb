require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start 
  @card_1 = Card.new("Who played Mr. Spock on the 1960's television show Star Trek?", "Leonard Nimoy", :Television)
  @card_2 = Card.new("Which James Bond film was released in 1962?", "Dr. No", :Film)
  @card_3 = Card.new("Which Romani guitarist is credited with creating the musical style known as Gypsy Jazz?", "Django Reinhardt", :Music)
  @card_4 = Card.new("Which character did Gillian Anderson play on the 1990's television show The X-Files?", "Dana Scully", :Television)
  @card_5 = Card.new("Who played The Joker in the 1989 film Batman?", "Jack Nicholson", :Film)
  @card_6 = Card.new("Which music group released the album Please Please Me in 1963?", "The Beatles", :Music)
  @card_7 = Card.new("Which 1960's television show included actor Don Knotts as the character Deputy Barney Fife?", "The Andy Griffith Show", :Television)
  @card_8 = Card.new("Who directed the 1997 film Titanic?", "James Cameron", :Film)
  @card_9 = Card.new("What year did singer/songwriter Kate Bush release the song Running Up That Hill?", "1985", :Music)
  @card_10 = Card.new("What is the unit of measurement used to describe the distance between the Earth and the Sun?", "astronomical unit", :Astronomy)
  @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7, @card_8, @card_9, @card_10])
  @round = Round.new(@deck)

  puts "\n"
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "-------------------------------------------------"

  card_categories = []

  @deck.cards.each do |card|
    unless card_categories.include?(card.category) 
      card_categories << card.category
    end 
  end 

  @deck.count.times do 
    puts "\n"
    puts "This is card number #{@round.turn_count + 1 } out of #{@deck.count}"
    puts "Question: #{@round.current_card.question}"
    puts "\n"
    user_guess = gets.chomp
    turn = @round.take_turn(user_guess)   
    puts "\n"
    puts turn.feedback
  end 
  
  puts "\n" 
  puts "****** Game over! ******"
  puts "\n"
  puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}"
  puts "\n"
  
  card_categories.each do |card|
    puts "#{card} - #{@round.percent_correct_by_category(card)}% correct"
    puts "\n" 
  end  
end 

start 
