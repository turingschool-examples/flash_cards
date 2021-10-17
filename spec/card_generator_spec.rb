require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe CardGenerator do

filename = "cards.txt"

cards = CardGenerator.new(filename).cards

# enter test here

end
