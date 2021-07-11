
require './lib/card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    File.open(filename, 'r') do |file|
      file.lines.map do |line|
        question, answer, category = line.chomp.split(',')

        Card.new(question, answer, category.to_sym)
      end
    end
  end
end
