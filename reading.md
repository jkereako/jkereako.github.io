---
layout: page
title: Reading
date: 2015-03-27 13:24:00
excerpt: Books I've read and boosk I'm reading.
permalink: /reading/
---

Reading is a life skill. In fact, it was a computer science professor who made
me realize this. [Computing I with Jim Canning][jim] included an introduction to
programming with C as well as **[The Elements of Style][eos]**, the preamble to
the Constitution, **[High Noon][high-noon]** and **[Flatland][flatland]**.
[Here's the webpage for his enrichment program][gauss]. Notice the healthy mix
of programming with fiction.

I'm currently reading **[Unbroken][current]**. It's a true story about an speedy
Italian immigrant who got drafted into the Army Air Corps during World War 2.
Last year, [it was made into a movie][unbroken-film] and was well received.

Before **Unbroken**, I read 200 pages of **[Lonesome Dove][previous]**. I had to
put it down, it could not keep my attention. I want to give it another shot
after I finish **Unbroken**.

Next on the list is **A Perfect Storm**, **Into Thin Air** and **John Adams**.

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
      <tr {% if book.active %} class="info"{% endif %}>
        <th scope="row">{{ forloop.index }}</th>
        <td>{{ book.title }}</td>
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

[current]: http://books.google.com/books/about/Unbroken.html?id=-KmXoAEACAAJ
[previous]: http://www.amazon.com/Lonesome-Dove-Novel-Larry-McMurtry/dp/1439195269
