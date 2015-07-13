---
layout: page
date: 2015-04-22 10:20:00
title: Reading
excerpt: A list of books which were recently read
permalink: /reading/
---
The most effective way to change your life is to read novels. The first book to
have this effect on me was **The Catcher in the Rye**.

I didn't feel this way until college. It was a computer science professor who
made me realize how important reading is. [Computing I with Jim Canning][jim]
included an introduction to programming with C as well as **[The Elements of
Style][eos]**, the preamble to the Constitution, **[High Noon][high-noon]** and **[Flatland][flatland]**. [Here's the webpage for his enrichment program]
[gauss]. Notice the healthy mix of programming with fiction.

## What I'm reading
**[For Whom the Bell Tolls][current]** by Earnest Hemingway. I'm not even 50
pages into it.

## What I just read
**[Blink][previous]**. I've mentioned before that I don't like non-fiction and
this was no exception. But, I must say that I did learn from this book.  In
particular, I learned that gut reactions are actually the unconscious mind
hinting to the concious mind that "hey, we've seen this kind of pattern before,
and the answer is usually this." I also learned that your unconscious can
sometimes be wrong (i.e. when cops shoot suspects who are believed to be armed
when they, in fact, are not) so you must supply your unconscious mind with
knowledge to make more accurate judgements. The only way to do this is to train
your conscious mind. Some of that knowledge will trickle down to the unconscious
where it will remain for a lifetime.

<div class="panel panel-default">
  <div class="panel-heading">Books read</div>
  <div class="panel-body">
    <p>
      Below is a list of the books I've read. The top-most item is the book I'm
      currently reading.
    </p>
  </div>
  <!-- Table -->
  <table class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>Title</th>
      </tr>
    </thead>
    <tbody>
      {% for book in site.data.books %}
      <tr {% if book.active %} class="info"{% endif %} data-row="{{ forloop.index }}">
        <th scope="row">{{ forloop.index }}</th>
        <td>
          {{ book.title }}{% if book.subtitle %}: {{ book.subtitle }}{% endif %}
        </td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

[jim]: http://www.cs.uml.edu/~canning/101/101.html
[gauss]: http://www.cs.uml.edu/~canning/TeamGauss.html
[eos]: http://www.gutenberg.org/ebooks/37134
[flatland]: http://www.gutenberg.org/ebooks/97
[high-noon]: http://www.imdb.com/title/tt0044706
[unbroken-film]: http://www.imdb.com/title/tt1809398

[current]: https://en.wikipedia.org/wiki/For_Whom_the_Bell_Tolls
[previous]: http://gladwell.com/blink/
