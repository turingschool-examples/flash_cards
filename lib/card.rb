# This is a file creating the hard class
# ITERATION 1
require 'pry'

class Card
    attr_reader :question, :answer, :category
    
    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end
end
