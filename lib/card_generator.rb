require_relative 'card'

class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards
    File.read(@filename).lines.map do |line|
      question, answer, category = line.chomp.split('|')
      Card.new(question, answer, category)
    end
  end
end