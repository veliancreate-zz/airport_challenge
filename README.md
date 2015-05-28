##[![Code Climate](https://codeclimate.com/github/veliancreate/airport_challenge/badges/gpa.svg)](https://codeclimate.com/github/veliancreate/airport_challenge)![Build Status](https://travis-ci.org/veliancreate/airport_challenge.svg?branch=master)


# Airport Challenge

1st week challenge at Makers Academy. Using Rspec to test an object oriented design.

### Skills used:

OOP, RSPEC, Ruby, TDD.

## Lessons learned:

I was pleased with how I dealt with this task. Initially I found using Rspec very unfamiliar and confusing, but after completeing Boris Bikes, found the implementation satisfying. The 'grand finale' part of the challenge where I had to handle errors was something I had not done before and was not covered in the Boris Bikes tutorial, so I was pleased that I managed to solve that. 

## Challenge spec:

Imagine you're writing software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. 

Occasionally it may be stormy, in which case no planes can land or take off.

Your task is to create a set of classes/modules to makes the given test suite pass. You will need to use random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). 

In your tests, you'll need to use a double to override random weather. Finally, every plane must have a status indicating whether it's flying or landed. You may expand on the original tests.

Read the [documentation](https://www.relishapp.com/rspec/rspec-mocks/docs) to learn how to use test doubles. There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

The specs are located [here](http://bit.ly/1dFD7f1). These specs are there just for the inspiration if you need it. You don’t have to implement every single example there and you aren’t limited by the examples there either. Feel free to modify the specs are you see fit.

Please create separate files for every class, module and test suite. Commit it to a repo on Github by the end of the day (or on the weekend if you started late).

The submission will be judged on the following criteria: Tests pass Tests coverage is good The code is elegant: every class has a clear responsibility, methods are short etc. Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

