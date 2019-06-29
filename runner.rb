require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Who was the first Disney princess?", "persephone", :Pop_Culture)
card_2 = Card.new("Janis Joplin, Jimi Hendrix, Jim Morrisson, and Kurt Cobain were all what age when they died?", "27", :Music)
card_3 = Card.new("Who originally sang the song 'I Love Rock 'N Roll'?", "arrows", :Pop_Culture)
card_4 = Card.new("Who was the lead singer of the 1980's group Culture Club?", "boy george", :Music)
card_5 = Card.new("Which singer's real name is Robyn Fenty?", "rihanna", :Music)
card_6 = Card.new("Which pop star played 27 different instruments on their debut album For You?", "prince", :Music)
cards = [card_1, card_2, card_3, card_4, card_5, card_6]
categories = []
categories << cards.map {|card| card.category}
deck = Deck.new(cards)

round = Round.new(deck)
def start(deck, round, categories)
  p "Welcome! You're  playing with #{deck.cards.count} cards."
  p "-------------------------------------------------"

  deck.cards.each do |card|
    p "This is card number #{round.deck.cards.index(card) + 1} out of #{deck.cards.count}."
    p "Question: #{card.question}"
    guess = gets.chomp.downcase
    p round.take_turn(guess).feedback
  end

  p "****** Game over! ******"
  p "You had #{round.number_correct} correct guesses out of #{deck.cards.count} for a total score of #{round.percent_correct}."

  categories.flatten.uniq.each do |category|
    p "#{category} #{round.percent_correct_by_category(category)}%"
  end
end

start(deck, round, categories)
