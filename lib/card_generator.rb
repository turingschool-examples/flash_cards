require_relative 'card'

class CardGenerator
  attr_reader :filename, :card_library

  def initialize(filename)
    @filename = File.read(filename)
    @card_library = card_library
  end


  def cards
    @card_library = @filename.split("\n")#note must use double quotes because string interpolation (won't work with single quotes around new line)
    @card_library.map! {|x| x.split(",")}.map! {|y| Card.new(y[0],y[1],y[2])}
    #@card_library.map! {|x| x.split(",")}.select! {|y| y[2] == 'STEM' ? Card.new(y[0],y[1],y[2]) : return }
  end
end

#require 'pry';binding.pry
