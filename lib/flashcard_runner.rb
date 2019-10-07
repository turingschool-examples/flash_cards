require_relative 'card'
require_relative 'deck'
require_relative 'turn'
require_relative 'round'

card_1 = Card.new("What is the capital of China?", "Beijing", :Geography)
card_2 = Card.new("What element does Fe stand for?", "Iron", :STEM)
card_3 = Card.new("Who was the first woman to receive a Nobel Prize?", "Marie Curie", :STEM)
card_4 = Card.new("What style of art is characterized by its distinct use of dots to form images?", "Pointillism", :Art)
card_5 = Card.new("Who painted the Mona Lisa?", "Leonardo da Vinci", :Art)

cards = [(card_1, card_2, card_3, card_4, card_5)]
deck = Deck.new(cards)
round = Round.new(deck)

def start
  puts "Welcome to the Flashcard Game!"
  puts "-" * 100
  puts "You are playing with #{@deck.count} cards. Get ready!"

  until @round.turns.count == @deck.count 
