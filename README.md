##  Flash Cards

This is the starter repository for the [Flash Cards](http://backend.turing.io/module1/projects/flashcards) project.


Review the number_correct method on the Round class:
Discuss the decisions you made to either store this information as an instance variable, or calculate the number any time the method is called.   
What are some pros and cons to each approach?   

-I chose to calculate the number of correct answers each time the method is called to ensure accuracy. This approach might be less performant for large datasets due to repeated calculations.

Review the percent_correct_by_category on the Round class:
Can you identify major differences in each approach to the implementation?
Discuss the scalability of each approach.   

-My current implementation calculates the percentage for each category every time the method is called. This might not scale well for a massive dataset; storing pre-calculated values could improve performance.

xReview each persons CLI:
Are your runner files similar or different?
What are some pros and cons to each person’s approach?

xReview each others code from a design perspective.
Does anything stick out as particularly readable, or well-designed?
Where are there areas for improvement in design or readability?   

xCompare each other git history (this will be easiest to do by reviewing the commits/branches on GitHub)

What did you find most challenging about using git/GitHub?   

-Not particularly difficult but there are growing pains as I learn new streamlined ways to commit and push and send PRs.

xReview the tests that your partner wrote for the take_turn method.

Is the method well tested?
Provide feedback on aspects of the test(s) that are particularly good, and provide constructive feedback on how the test(s) could be improved.   

-It would be helpful to see if the tests cover edge cases, such as incorrect user input or unexpected game states. Also, testing user input isn't straightforward, so it might be helpful to mock user input.

Discuss what you each found most difficult about the project.

-Integrating new features while maintaining existing logic proved to be a challenge.

Discuss what you each are proudest of from this project.

-Successfully implementing a working game and incorporating a user understanding test question. This demonstrates a grasp of core coding concepts and their application.