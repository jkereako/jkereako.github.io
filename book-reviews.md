---
layout: page
date: 2015-01-14 13:45:00
title: Book reviews
excerpt: My reviews of various books
permalink: /book-reviews/
---
Below is a list of books I reviewed. I haven't reviewed all of the books I've
read, just the notable ones.

{% for post in site.posts  %}
  {% if post.category == "Book review" %}
  <article class="excerpt">
    <header>
      <h3><a href="{{ post.url }}">{{ post.title | camel_break }}</a></h3>
    </header>
    {{ post.excerpt | markdownify }}
  </article>
  {% endif %}
{% endfor %}
