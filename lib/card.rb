 require 'pry'

class Card
  attr_reader :question, :answer #:catagory

def initialize(question, answer, catagory)
  @question = question
  @answer = answer
  # @catagory = catagory
  end
end





card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
 binding.pry
