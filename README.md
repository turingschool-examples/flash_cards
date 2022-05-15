##  Flash Cards

This is the starter repository for the [Flash Cards](http://backend.turing.io/module1/projects/flashcards) project.

Run 'ruby runner.rb' from the commandline to play the game!

## Iteration 1

The goal of iteration 1 is to create a card instance and turn instance. 

## Card Class explained

 - Initialize method
    - this method requires 3 arguments to create a card:
        - question
        - answer
        - category
    These are the arguments needed to create a card. I anticpate being able to store/call on these cards later by category.

## Turn class explained
 - Initialize method
    * guess
    * card
    - This method has the two arguments above. card refers to an instance of the card class. Guess refers to the guess the the user inputted. This will be interesting to change this from a instance I created in testing to being able to be evaluated by user input.

 - Correct? method
    - This method uses an 'if' block to compare the answer that is stored in the instance of card class and the guess the user put in. If they are the same this boolean returns true. In any other case the boolean returns false. This helper method helped to create the feedback statement.

    An edgecase that I prepared for was if the user/card instance were a match but the only difference was the capitilization didn't match. by placing '.capitalize' in my if block I was able to capitalize both answers so that the would match regardless of input capitaliztion errors. 

 - Feedback method
    - This method takes the input from the return method and uses and 'if' block to determine the correct feedback. For instance, if the correct? method returns true feedback will return 'Correct!'. In any other instance other than correct? returning true feedback will return 