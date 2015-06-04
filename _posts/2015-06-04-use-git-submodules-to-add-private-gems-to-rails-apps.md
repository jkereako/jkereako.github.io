---
title: Use Git submodules to add private gems to Rails apps
author: Jeff Kereakoglow
category: Code
excerpt: Quick instructions on proper use of Git submodules
layout: post
---
Once upon a time, I needed to build a Rails app around a closed-source gem. My
first reaction was to copy the gem's source code directly into the vendor
directory of the Rails app, but I figured there is a better way: Git submodules.

## Prerequisite
For this method to work, both the gem and the Rails application must be tracked
in Git.

## Steps
First, `cd` into your Rails app directory and then enter the command
`git submodule` and provide the URL to the Git repository and the directory in
 which you want the submodule.

You ought to install your gem in the `vendor` directory. The `lib` directory is
intended for tasks and other things that you would think belong elsewhere.
{% highlight sh %}
$ cd ~/src/ruby/rails-app
$ git submodule add https://github.com/jkereako/private_gem vendor/private_gem
Cloning into 'vendor/private_gem'...
remote: Counting objects: 26, done.
remote: Compressing objects: 100% (17/17), done.
remote: Total 26 (delta 8), reused 19 (delta 5)
Unpacking objects: 100% (26/26), done.
{% endhighlight %}

Next, build the gem in the directory

{% highlight sh %}
$ cd vendor/private_gem
$ gem build private_gem.gemspec
  Successfully built RubyGem
  Name: private_gem
  Version: 0.0.1
  File: private_gem-0.0.1.gem
{% endhighlight %}

Add the gem to the Gemfile of the Rails app. You must provide both the gem
version and the path to the submodule.

{% highlight ruby %}
gem 'private_gem', '0.0.1', path: './vendor/private_gem'
{% endhighlight %}

Finally, use `bundler` to install the gem.
{% highlight sh %}
$ bundle install
Resolving dependencies...
Using rake 10.4.2
Using i18n 0.7.0
...
...
Bundle complete! 21 Gemfile dependencies, 74 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
{% endhighlight %}

## Keep submodules current
Git provides a simple command to update all submodules to the latest commit of
their respective repositories.
{% highlight sh %}
$ git submodule foreach git pull origin master
{% endhighlight%}
