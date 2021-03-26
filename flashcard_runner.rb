require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'
require 'pry'

game = Game.new(false)

game.start
