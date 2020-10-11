class Card_Generator
attr_reader :cards
  def initialize (filename)
    @file_name = filename
    @cards = []
  end

require './lib/card'

contents = []
  File.open(@filename).each do |line|
    contents << line
  end

  contents.each do |element|
    if element.include? "\n"
      element.gsub!(/\n/, "")
    end
  end

arguments = []
  contents.each do |element|
    arguments <<element.split(",")
  end

until arguments == []
    @cards << Card.new(arguments[0][0],arguments[0][1], arguments[0][2])
    arguments.shift
  end

end

Card_Generator.new("cards.txt").cards
