require './lib/card'

class CardGenerator
  attr_reader :questions, :cards
  def initialize(filename)
    @questions = []
    @cards = []
    File.open(filename).each {|line| @questions << line.chomp().split(',')}
    @questions.each {|q| @cards << Card.new(q[0], q[1],  q[2])}
  end

end
