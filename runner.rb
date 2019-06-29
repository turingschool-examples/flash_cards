require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

card_1 = Card.new("Who was the first Disney princess?", "Persephone", :Pop_Culture)
card_2 = Card.new("Janis Joplin, Jimi Hendrix, Jim Morrisson, and Kurt Cobain were all what age when they died?", "27", :Music)
card_3 = Card.new("Who originally sang the song 'I Love Rock 'N Roll'?", "Arrows", :Pop_Culture)
card_4 = Card.new("Who was the lead singer of the 1980's group Culture Club?", "Boy George", :Music)
card_5 = Card.new("Which singer's real name is Robyn Fenty?", "Rihanna", :Music)
card_6 = Card.new("Which pop star played 27 different instruments on their debut album For You?", "Prince", :Music)
filename = 'cards.txt'
@cards = CardGenerator.new(filename).cards
deck = Deck.new(@cards)

round = Round.new(deck)
def start(deck, round)
  puts "Welcome! You're  playing with #{deck.cards.count} cards."
  puts "-------------------------------------------------"

  deck.cards.each do |card|
    puts "This is card number #{round.deck.cards.index(card) + 1} out of #{deck.cards.count}."
    puts "Question: #{card.question}"
    guess = gets.chomp
    puts round.take_turn(guess).feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{deck.cards.count} for a total score of #{round.percent_correct.to_i}%."
  categories = []
  @cards.each {|card| categories << card.category}
  categories.flatten.uniq.each do |category|
    puts "#{category} #{round.percent_correct_by_category(category).to_i}% correct"
  end
end

start(deck, round)
