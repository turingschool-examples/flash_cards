require 'pry'
require "./lib/card"

class CardGenerator

  def initialize(filename)
    @file = filename
  end

  def cards
    card_array = []
    File.readlines("./lib/#{@file}").each do |line|
      card_array << Card.new(*line.strip.split(","))
    end
    card_array
  end

end
