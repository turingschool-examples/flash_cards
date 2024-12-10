# FILE: lib/card.rb
require 'pry' # This is required to use Pry

class Card #create a class called Card
  attr_reader :question, :answer, :category
    #makes the question, answer, and category readable to the user
  def initialize(question, answer, category) #initialize the class with the following parameters
    @question = question #set the question to the question parameter
    @answer = answer #set the answer to the answer parameter
    @category = category #set the category to the category parameter
  end
end






