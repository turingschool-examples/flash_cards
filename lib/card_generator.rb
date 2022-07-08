# frozen_string_literal: true

class CardGenerator
  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    result = []
    cards = []
    file_data = File.readlines(@filename).map(&:chomp)
    # This block of code is taking the file_data, which is an array of lines from cards.txt
    # which then further splits them into seperate arrays, allowing me to grab
    # at certain chunks of text, to hand them to the variables of the class card.
    file_data.map { |line| result << line.split(',') }

    (0..file_data.count - 1).each do |num|
      question = result[num][0]
      answer = result[num][1]
      category = result[num][2]
      cards << (Card.new(question, answer, category))
    end
    Deck.new(cards)
  end
end
