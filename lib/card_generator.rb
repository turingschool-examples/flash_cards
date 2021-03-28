require 'pry'
    puts Dir.pwd
class CardGenerator
  attr_reader :filename,
              :cards,
              :dir_path

  def initialize(filename)
    @filename = Rails.root.join(".","lib",filename)
    @cards = []
    create_cards
  end

  def create_cards
    File.foreach(@filename) do |line|
      @line_text = line.split(",")
      @card = Card.new(@line_text[0], @line_text[1], @line_text[2])
      @cards.push(@card)
    end
    puts @cards
  end
end
