---
title: Excited about CoffeeScript
author: Jeff Kereakoglow
category: Code
excerpt: CoffeeScript > JavaScript
layout: post
---
In the process of maintaining this blog, I was reintroduced with CoffeeScript. I first read about CoffeeScript in 2009 but I never learned it and I soon forgot about its existence.

For the past 2 weeks I have been learning and practicing CoffeeScript and I wrote this article to share my excitement.

If you write JavaScript regularly and do not use CoffeeScript, I implore you to switch to CoffeeScript. I have wasted hours writing and debugging JavaScript which could have been simplified had I just used CoffeeScript.

## A syntax centered around brevity
CoffeeScript borrows strict indentation and list comprehensions from Python, optional parenthesis around method calls (there are exceptions to this rule) and implied `return` statements from Ruby.

These features reduce keystrokes which, of course, reduce development hours.

## Encapsulation
When CoffeeScript is compiled, the script is wrapped in a closure thusly:
{% highlight javascript %}
(function() {
  // code here...
}).call(this);
{% endhighlight%}

This scopes the script to within the boundaries of the closure. Proper scoping prevents method overwriting, name collisions and prevents folks from executing the script inside the JavaScript console.

This will ensure that your script will execute as intended without error.

## Automatic boilerplate injection
For example, if you use the method `indexOf()`, you ought to write a routine which creates the method `indexOf()` in the case that a browser does not define it. I **always** forgot to do this in JavaScript, and as a result, my JavaScript was fragile.

CoffeeScript takes care of this for you.
{% highlight coffeescript %}
arr = ['Jimmy', 'crack', 'corn']
'Jimy' in arr
{% endhighlight %}

{% highlight javascript %}
var arr,
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

arr = ['Jimmy', 'crack', 'corn'];

__indexOf.call(arr, 'Jimy') >= 0;
{% endhighlight %}

## Readability
This is best shown through example. This straight-forward class:

{% highlight coffeescript %}
  class Animal
    constructor: (@name) ->

    move: (meters) ->
      alert @name + " moved #{meters}m."

  class Snake extends Animal
    move: ->
      alert "Slithering..."
      super 5

  class Horse extends Animal
    move: ->
      alert "Galloping..."
      super 45

  sam = new Snake "Sammy the Python"
  tom = new Horse "Tommy the Palomino"

  sam.move()
  tom.move()
{% endhighlight %}

Is compiled into this monstrosity:

{% highlight coffeescript %}
var Animal, Horse, Snake, sam, tom,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Animal = (function() {
  function Animal(name) {
    this.name = name;
  }

  Animal.prototype.move = function(meters) {
    return alert(this.name + (" moved " + meters + "m."));
  };

  return Animal;

})();

Snake = (function(superClass) {
  extend(Snake, superClass);

  function Snake() {
    return Snake.__super__.constructor.apply(this, arguments);
  }

  Snake.prototype.move = function() {
    alert("Slithering...");
    return Snake.__super__.move.call(this, 5);
  };

  return Snake;

})(Animal);

Horse = (function(superClass) {
  extend(Horse, superClass);

  function Horse() {
    return Horse.__super__.constructor.apply(this, arguments);
  }

  Horse.prototype.move = function() {
    alert("Galloping...");
    return Horse.__super__.move.call(this, 45);
  };

  return Horse;

})(Animal);

sam = new Snake("Sammy the Python");

tom = new Horse("Tommy the Palomino");

sam.move();

tom.move();
{% endhighlight %}

I certainly could not write the JavaScript above without error. But, more importantly, the JavaScript above is **difficult to read**.

## Reduced syntax errrors
Live compilers like [JS2coffee](http://js2.coffee) allow you to write and validate CoffeeScript in realtime. Use this to find syntax errors.

## Makes you look like a master
Users can only see compiled JavaScript. Even a simple, object-oriented script in CoffeeScript (see example above) will become complex JavaScript. This will impress the pants off of other developers who are ignorant to CoffeeScript (i.e. me circa January 2015).
