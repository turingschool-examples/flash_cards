require './lib/card_generator'
require './lib/card'
require 'pry'

cards_txt = File.read("cards.txt").split("\n")

cards_ary = cards_txt.collect {|card| card.split(",")}

# card = [card.question, card.answer, card.category]

binding.pry

deck = cards_ary.collect {|card| Card.new(card[0], card[1], card[2])}
