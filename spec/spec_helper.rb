require 'simplecov'

SimpleCov.start do
  add_filter 'lib/play_game'
end

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/play_game'
require './lib/card_generator'
