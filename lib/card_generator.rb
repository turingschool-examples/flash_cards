require './lib/card'

class CardGenerator
  attr_reader :file

  # require 'pry'; binding.pry

  def initialize(filename)
    @file = File.open(filename)
  end

  def cards
    card_set = []
    cards_as_array = @file.read.split("\n")
    cards_as_array.each do |card_in_array|
      card_info = card_in_array.split(",")
      card = Card.new(card_info[0], card_info[1], card_info[2])
      card_set << card
    end
    return card_set
  end

end


# test passes, but in pry I'm getting error:
# [3] pry(main)> cards = CardGenerator.new(filename).cards
# NameError: uninitialized constant CardGenerator::Card
# from /Users/aliyamerali/Turing/1Mod/projects/flash_cards/lib/card_generator.rb:15:in `block in cards'

# Resolved this by adding require './lib/card' to the file, but why didn't I need
# this in other class defs that call other classes?
