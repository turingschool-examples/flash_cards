# card_generator.rb
require 'pry'
require_relative 'card'

class CardGenerator
  attr_reader :cards
  def initialize(filename)
    filename = File.readlines("lib/#{filename}")
    #incoming_text = filename.read
    #filename.close
    @cards = []
    filename.each.with_index do |card_info, i| #index
      # adding each card into array of cards, cut off /n
      i = card_info.split(",")
      i[2] = i[2].chomp # remove the returns from string
      @cards << Card.new(i[0],i[1],i[2])
      #@cards << card_info[0..-2]
        # card_1 = Card.new("What is 2 + 3?", "5", :Math)
    end
  end
end
