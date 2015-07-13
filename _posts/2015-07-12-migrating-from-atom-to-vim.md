---
title: Migrating from Atom to Vim
author: Jeff Kereakoglow
category: Code
excerpt: Going back in time to 1991
layout: post
---

Recently, I decided to use [Vim][vim] as my default text editor. Previously, I
used [Atom][atom]. Before Atom, I used [SublimeText][sublime] and before
SublimeText I used [Geany][geany]. So, as far as I can remember I have always
used a GUI text editor.

# Why use Vim?
Often, there are 2 reasons for decisions: the good reason, which is what you
tell people, and the real reason.

**The good reason**: I want to improve my touch-typing skills. Vim is famous
for having all commands centered around the home row, and so it is conducive to
mastering touch-typing.

**The real reason**: I want to impress my software developer peers by telling
them, "well... *I* use Vim."

I actually did want to improve my touch typing skills, but I could have easily
used Atom for that purpose by taking advantage of their keystroke commands.
However, everywhere I look, some developer—this is especially true in the Rails
community—uses Vim. I wanted to be part of the clique.

## Vim seems silly
I'm writing this post in Vim on Apple's latest version of the 15" MacBook Pro.
This is a $2,500 machine. I'm using a 24 year-old text editor which was meant to
run on machines 1/1000 of this MacBook Pro's processing power.

A text editor originally invented 40 years ago–Vim is built on top of Vi which
was invented in 1976–is still widely used by young developers all across the
globe.

I still can't get beyond this.

## Advantages of Vim
Below are some of the advantages I have seen from using Vim.

### Start up time is instantaneous
Although Atom is a text editor and not an IDE, it still takes a few seconds for
it to start up. Vim, however, starts immediately. It may sound petty to complain
about a start up time that takes longer than an instant, but I do remember times
of frustration waiting for Atom to finish booting so I can begin. The calm Jeff
can wait, the impatient and stressed Jeff cannot.

### Ubiquity
Every distribution of Linux and all versions of Mac OS X have Vim installed.
I can always rely that where there is Bash, there is Vim.

### Fingers do not stray far from home
Text editing in Vim, once you get the hang of the keystrokes, is actually faster
in Vim than it would be in a GUI editor. Much of my time in Atom was spent
visually searching for the file I want to edit so I can click on it with my
mouse. Finding a file in Vim to edit is done with these keystrokes:

 `:find name-of-file`

Hit `enter` and you're suddenly editing that file.

### The plugins
Better still are some of the plugins for Vim which further enhance editing
speed. One in particular written by the oddball [Tim Pope][tpope] allows you to
quickly switch between corresponding files in Rails projects, for example,
switching between the model and the controller. The plugin is aptly titled
[vim-rails][vim-rails].

Plugins like vim-rails **do exist** for Atom and SublimeText which allow you to
search for files and toggle between files using key commands, but neither
feature is routinely used in a GUI text editor, which, makes sense. Mice are
intended to be used with GUIs. If you want to use a GUI text editor as if it
were Vim, then why not use Vim?

### Spell checking is superior
I have to say, the spell check plugin for Vim is the fastest and most
user-friendly spell check plugin I have ever used. A misspelled word is
immediately highlighted and, if you can't figure out the correct spelling, you
simply hit `tab` while in insert mode, and a list of predicted words will
appear. Select the correct word with the arrow keys. Brilliant!

## Disadvantages
Vim has a steep learning curve. I expect it will take several months of Vim
immersion before I can truly see benefits. Currently, I can't tell if I'm faster
in Vim or Atom because I still need to think about the commands before I enter
them in Vim.

## Do I actually like Vim?
No, I don't. I also didn't like scotch the first few times I drank it but I
enjoy it now. That begs the question, do I really like scotch or did I force it
down so many times that trained my brain to like it? Why did I force myself to
drink scotch in the first place? If you force yourself to like something, is
that even considered liking it, or must you like it from the start?

Compelling questions indeed and I'm certain such will be the case with Vim. That
is, I'll train myself to like it.

In any case, I will continue to immerse myself in Vim until I feel I've mastered
it and then I'll brag about how I'm a Vim user.

[vim]: http://www.vim.org
[atom]: https://atom.io
[sublime]: http://www.sublimetext.com
[geany]: http://www.geany.org
[dotfiles]: https://github.com/thoughtbot/dotfiles/blob/master/vimrc#L115-L118 
[tpope]: https://github.com/tpope
[vim-rails]: https://github.com/tpope/vim-rails
