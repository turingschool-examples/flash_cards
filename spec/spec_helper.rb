require 'simplecov'
SimpleCov.start do
  add_filter './lib/game'
end 

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
