#require './lib/cards.txt'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class Cardgenerator
  attr_accessor :data, :filename, :file, :cards
  def initialize(filename)
    @data = []
    @cards = []
    file = File.open(filename).each do |line|
      @data << line.to_str.sub("\n","").split(",")
    end
    @data.each do |arr|
      @cards << Card.new(arr[0], arr[1,], arr[2])
    end
  end

end
