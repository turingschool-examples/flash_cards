require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

class CardGenerator
  attr_reader :cards

  def initialize(file)
    @cards = []
    File.readlines(file).each do |line|
      array = line.to_s.split(';')
      array[1] = array[1].to_i if array[1].to_i.to_s == array[1]
      card = Card.new(array[0], array[1], array[2].chomp.to_sym)
      @cards << card
    end
  end
end
