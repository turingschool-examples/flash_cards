require 'pry'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

card_1 = Card.new("Who is leading the NBA in points per game?", "Luka Doncic", :basic_stats)
card_2 = Card.new("What team is leading the NBA in points per game?", "Indiana Pacers", :team_stats)
card_3 = Card.new("Who is leading the NBA in Box Plus/Minus?", "Nikola Jokic", :advanced_stats)
card_4 = Card.new("Who is leading the NBA in VORP?", "Nikola Jokic", :advanced_stats)
card_5 = Card.new("How many assists per game is Tyrese Halliburton averaging?", 12, :basic_stats)
card_6 = Card.new("What team has most wins in the NBA?", "Boston Celtics", :team_stats)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]

deck = Deck.new(cards)

round = Round.new(deck)

round.start
round.summary
