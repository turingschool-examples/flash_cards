require './lib/turn'
require './lib/card'

turn1 = Turn.new("Juneau")

turn1.read_card("What is the capital of Alaska?")

require "pry"; binding.pry
