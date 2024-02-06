require 'pry'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

card_1 = Card.new("Who is leading the NBA in points per game?", "Luka Doncic", :"Basic Stats")
card_2 = Card.new("What team is leading the NBA in points per game?", "Indiana Pacers", :"Team Stats")
card_3 = Card.new("Who is leading the NBA in Box Plus/Minus?", "Nikola Jokic", :"Advanced Stats")
card_4 = Card.new("Who is leading the NBA in VORP?", "Nikola Jokic", :"Advanced Stats")
card_5 = Card.new("How many assists per game is Tyrese Halliburton averaging?", 12, :"Basic Stats")
card_6 = Card.new("What team has most wins in the NBA?", "Boston Celtics", :"Team Stats")
card_7 = Card.new("Who is the worst team in the NBA?", "Detroit Pistons", :"Team Stats")
card_8 = Card.new("Who is the reigning NBA champion?", "Denver Nuggets", :"Team Stats")
card_9 = Card.new("Who is the all time leader in points scored?", "Lebron James", :"Basic Stats")
card_10 = Card.new("Who has the highest effective field goal percentage?", "Dereck Lively", :"Advanced Stats")

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10]

deck = Deck.new(cards)

round = Round.new(deck)

round.start
round.summary
