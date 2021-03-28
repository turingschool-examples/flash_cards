require 'pry'
require './lib/card'
    puts Dir.pwd
class CardGenerator
  attr_reader :filename,
              :cards,
              :filename_relative

  def initialize(filename)
    @filename = filename
    @filename_relative = File.join(".","lib",@filename)
    @cards = []
  end

  def create_cards
    File.foreach(@filename_relative, "\n") do |line|
      @line_text = line.split(",")
      # binding.pry
      @category =  @line_text[2].chomp.intern
      @card_new = Card.new(@line_text[0], @line_text[1], @category)
      @cards << @card_new
      # binding.pry
    end
  end
# binding.pry
end
