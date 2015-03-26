---
title: How to create a pull-request branch
author: Jeff Kereakoglow
categories : [Code, Git, GitHub]
excerpt: The right way to make a pull-request
layout: post
---
## Problem
You forked a repository on GitHub, made a bunch of changes and then pushed them to GitHub. Now you want to submit a pull-request to fix a bug you found. However, because your fork is a dozen revisions beyond the original repository you're certain your pull-request will be rejected.

## Solution
Create a new branch which copies the current state of the original repository, make your change, and then submit your pull-request.

> NOTE
>
> You always ought to create a separate branch for pull-requests.

- [Create a remote tracking branch called "upstream"](https://help.github.com/articles/configuring-a-remote-for-a-fork/) which tracks the master branch of the original repository.
  {% highlight sh %}
  $ git remote add upstream https://github.com/origin/repo.git
  {% endhighlight %}
- Fetch the latest changes from the branch `upstream`:
  {% highlight sh %}
  $ git fetch upstream
  {% endhighlight %}
- Create a new branch for the pull-request called `pr-bug-fix` and switch to that branch
  {% highlight sh %}
  $ git checkout -b pr-bug-fix
  {% endhighlight %}
- Reset `pr-bug-fix` to the current state of `upstream`
  {% highlight sh %}
  $ git reset --hard upstream/master --
  {% endhighlight %}

Now `pr-bug-fix` is synchronized with the current state of the original repository. As such, you can safely fix the bug submit the pull-request.
