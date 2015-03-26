---
title: Rename several file extensions in the command line
author: Jeff Kereakoglow
categories : [Code]
excerpt: Quick shell script to rename file extensions
layout: post
---

This script iterates over a list of files with a specified file extension (in this case they are Matroska files) and renames them.

Type the script below directly into the command line, hitting "return" after each line.
{% highlight sh %}
$ for file in *.mkv
$ do mv "$file" "${file/.mkv/.avi}"
$ done
{% endhighlight %}
