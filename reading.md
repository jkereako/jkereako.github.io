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

Below is a list of all of the books I've read
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
