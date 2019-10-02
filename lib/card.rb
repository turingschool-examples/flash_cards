class Card
require 'pry'
  attr_accessor :question, :answer, :geography, :people, :places, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @geography = category[:geography]
    @people = category[:people]
    @places = category[:places]

  end
end
