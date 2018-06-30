# Gelato Recipe Calculator
#### A side project in object-oriented programming

### Introduction

This calculator will help a chef devise new gelato recipes. When frozen, Gelato will only set properly if its constituents are properly balanced as follows:

* Fat: 6-12%
* Sugar: 16-22%
* Lean milk solids: 8-12%
* Water: 58-68%

In its current iteration, this calculator will allow you to interact with ingredient, gelato and calculator objects to devise new recipes and ensure that the constituents of the finished gelato are within these ranges.

My next plan is to use this object-oriented framework as the backend (the model in the MVC) of a web app, in which one can interact with the ingredients in a web-based table, and see the calculation performed on the page.

### Setup

* You will need Ruby 2.5.0 and bundler installed (if necessary install bundler with `gem install bundler`)
* Clone this repository
* Run `bundle install`
* Load the contents of the `lib` folder into a ruby command line environment (such as irb or pry)
* Enjoy creating ingredient, gelato and calculator objects!

### Usage

Create ingredient objects and assign them to variables using `Ingredient.new`. Each ingredient will need to be initialized with five arguments, representing the percentage of its constituents, fat, sugar, lean milk solids, other solids and water. So for example, cream at 35% fat might be instantiated as follows:

`cream = Ingredient.new(35, 0, 6, 0, 59)`

These ingredient objects can now be passed into a gelato object using the `add_ingredient` method. This takes two arguments, the first of which must be an ingredient object, and the second which must be an integer representing the number of grams of that ingredient:

`stracciatella = Gelato.new`
`stracciatella.add_ingredient(cream, 200)`

Ingredients can also be removed from the gelato with the `remove_ingredient` method:

`stracciatella.remove_ingredient(cream)`

You can also update the number of grams of an ingredient using `modify_grams`, passing in the ingredient and a new weight in grams:

`stracciatella.modify_grams(cream, 300)`

At any time it is possible to run `.ingredients` on your gelato object to see a list of ingredients. Once all the ingredients have been added to the gelato, it can be passed to a calculator object to run the necessary calculations:

`calc = Calculator.new(stracciatella)`

This calculator will then print a hash letting you know whether the constituents in the gelato are overall within the correct ranges to make gelato, for example:

`{:fat=>true, :sugar=>true, :lean_milk_solids=>true, :other_solids=>true, :water=>true}`

 If any of the values are not within the correct range, you can adjust the ingredients within the gelato and run `.calculate` on the calcuator to recalculate again (optionally you can pass in a new gelato object as an argument).

 ### Testing

 This project has been entirely test-driven in RSpec. To run the tests, run `rspec` from the root folder. Tests are run with extensive doubling and stubbing of gelato ingredient objects and their behaviour.

 Additionally, you can run the `feature_test.rb` in the spec folder, which will construct a true to life gorgonzola and honey gelato recipe devised by my friend Chris, and open Pry for you to interact with the objects:

 ![Chris' recipe](https://user-images.githubusercontent.com/35489501/41294947-2b8fac1c-6e51-11e8-8297-376b412858b9.jpeg)

 ### To improve
 A list of changes and improvements I would like to make include:
 * An improved calculator output which tells you whether the constituent percentages are too high or too low, rather than boolean values of whether they're within the correct range
 * The calculator class is too bloated, and contains information which should rightly be stored in the Gelato object. I would like to reassess this division of state and behaviour, as well as extracting a printer class.
 * The next stage of development will be to use this code as the backend of a web app, likely hosted in Sinatra, where one can interact with ingredients in a web-based table, and make the calculations while also displaying information such as the constituent quantities.
