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


# to get directoru path use File.dirname(__FILE__)
# to get the file path use File.expand_path(__FILE__)

#get the file path of the file you are in by using File.expand_path(__FILE__)


#create runner files to run the code
