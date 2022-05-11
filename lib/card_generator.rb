require_relative 'card'
class CardGenerator
  attr_reader :filename, :card_library

  def initialize(filename)
    @filename = File.read(filename)
    @card_library = card_library
  end

  def create_objects_from_text_file
    @card_library = @filename.split("\n")#note must use double quotes because string interpolation (won't work with single quotes around new line)

  end

  def cards
    @card_library
  end
end


#cards = CardGenerator.new('cards.txt')
#cards.create_objects_from_text_file(filename)

require 'pry';binding.pry
