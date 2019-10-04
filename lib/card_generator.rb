require 'pry'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def get_text
    File.readlines(@filename).each do |line|
      @cards << line
    end
  end
end

cards = CardGenerator.new("cards.txt").get_text

binding.pry

# file = File.open("cards.txt").each do |line|
#   puts line
# end
#
# file.readlines
