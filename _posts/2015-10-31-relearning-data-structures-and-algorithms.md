---
title: Relearning data structures and algorithms
author: Jeff Kereakoglow
category: Code
excerpt: It has been 10 long, forgetful years
layout: post
---

That's right. I'm writing this post on Halloween night in Salem, Massachusetts.

The title of this post is ambiguous. What I mean by "forgetful" is I've, almost
entirely, forgotten all I know about fundamental data structures and algorithms.
I don't practice them daily, so knowledge of them naturally withered over time.
I've since made a commitment to revisit them.

Now, I don't have a CS degree. I only minored in CS. At the time, I thought it
would be advantageous to have a strong background in business and a familiarity
with programming. But, at my first job out of college, I quickly realized all
that I learned in business school would not apply to any software development
job.

# Data structures
A couple weeks ago, I committed to relearn the data structures which were taught
to me by [Jim Canning][jim] in [91.101][comp1]. In his class, students were
taught to implement data structures and algorithms in C. And so, when I began my
endeavor, [I wrote an implementation of a linked list and a stack in C][c_ds].
It wasn't long before my impatience got the best of me.

C is a difficult language to code in. Since college, I've become so used to
object-oriented languages like Swift, Ruby, Python and PHP that being forced to
write header files and function declarations drove me bananas. Creating a string
in C is not an easy task. I spent too much time tediously fixing syntax errors
in my C code that I couldn't focus on the subject at hand. So I gave up.

# Along came Python
[I forked a repository][repo] of algorithms written in Python and began to
contribute. It was cakewalk compared to my C implementations. The code was
easier to follow and the best part is tests written with Python's
[`unittest`][ut] framework can be run all at once with the following command:

``` python -m unittest discover```

I was quickly inspired me to purchase a few books on algorithm design which
contain coding puzzles and problems. I'm in the process of reading and solving
those problems.

# Python in higher education
These days, universities ([MIT is one of them][mit]) teach fundamental
algorithms design and data structures in Python, not C. With Python, students
can focus on constructing programs instead of yielding to GCC's unforgiving
syntax.

But, Python cloaks the underlying operations that are more evident in C (i.e.
pointer manipulation, dynamic memory allocation and static arrays). That said,
having exposure to C is important for a proper CS education, but I don't think
it is the language to use when studying algorithms. I spent too many late nights
in Olsen Hall stuggling with C.

# Conclusion
Learn, or "drink in" as Jim would say, the basic data structures and algorithms
which have shaped the technology industry. Have an intimate knowledge of the
programs you build. Revisit these concepts every year to retain this
information. Do not wait 10 years like I did. And, if you don't have a GitHub
account, get one! You **need** a digital notebook.

[jim]: http://www.uml.edu/Honors/People/canning-james.aspx
[comp1]: http://www.cs.uml.edu/~canning/101/101.html
[c_ds]: https://github.com/jkereako/c-data-structures
[algo]: https://github.com/jkereako/algorithms
[mit]: http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/
[repo]: https://github.com/jkereako/algorithms
[ut]: https://docs.python.org/3/library/unittest.html
