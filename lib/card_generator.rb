# frozen_string_literal: true

class CardGenerator
  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file_data = []
    File.foreach(@filename) do |line|
      line = line.chomp
      # card = Card.new("", "", )
      file_data << line
    end
    p file_data
    file_data
  end
end
