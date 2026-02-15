
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hext

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/matt-dray/hext/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/matt-dray/hext/actions/workflows/R-CMD-check.yaml)
[![format-check.yaml](https://github.com/matt-dray/hext/actions/workflows/format.yaml/badge.svg)](https://github.com/matt-dray/hext/actions/workflows/format.yaml)
[![jarl-check](https://github.com/matt-dray/hext/actions/workflows/lint.yaml/badge.svg)](https://github.com/matt-dray/hext/actions/workflows/lint.yaml)
<!-- badges: end -->

      ________
     /        \
    /    ⬡⬢    \
    \   hext   /
     \________/

## About

Hex stickers… but text.

[Bye, hex stickers](https://yihui.org/en/2026/02/bye-stickers/).
Inspired by artistry in [Yihui’s
{litedown}](https://github.com/yihui/litedown) and then [Charlie’s
{secretbase}](https://github.com/shikokuchuo/secretbase/).

## Install

The package is a GitHub exclusive for now.

``` r
install.packages("pak") # if not yet installed
pak::pak("matt-dray/hext")
```

## Use

You can add text (`text_*`) and align it (`align_*`) for each of your
hex’s four writable lines (`*_1` to `*_4`). You cannot exceed the
allotted character width inside the hex border.

Here’s an example:

``` r
# fmt: skip
hext::hext(
  "hello", "this ", "is", "_hext", # space/underscore adjust
  "left", "right", "centre", "left"
)
#   ________
#  /hello   \
# /     this \
# \    is    /
#  \_hext___/
```

Rendering is hard. Your kilometreage may vary with [Unicode
characters](https://en.wikipedia.org/wiki/List_of_Unicode_characters),
including emojis. `hext()` defaults to assessing the display width of
text, rather than character count.

``` r
hext::hext(
  "😀",
  "✋👔🤚",
  "👖",
  "👟👟"
)
#   ________
#  /   😀   \
# /  ✋👔🤚  \
# \    👖    /
#  \__👟👟__/
```

In the spirit of fudging it, you can make `hext()` count characters
instead. For example, this package’s logo uses a couple of [Unicode
hexagons](https://en.wikipedia.org/wiki/Miscellaneous_Symbols_and_Arrows):

``` r
# fmt: skip
hext::hext(
  text_2 = "⬡⬢", align_2 = "centre",
  text_3 = "hext", align_3 = "centre",
  count_type = "chars" # instead of 'width'
)
#   ________
#  /        \
# /    ⬡⬢    \
# \   hext   /
#  \________/
```

Anyway, text is best and [ASCII
art](https://en.wikipedia.org/wiki/ASCII_art) can got a long way. Here
is a cat.

``` r
hext_cat <- hext::hext(
  r"{/\__/\}", # escape with raw strings
  "={ o x o}=",
  "l(  u u )",
  "_b___b",
  print = FALSE # return char vector invisibly
)
hext_cat |> cat()
#   ________
#  / /\__/\ \
# /={ o x o}=\
# \l(  u u ) /
#  \__b___b_/
```

## The Text-Stickers Standard

You may be aware of the [the Stickers
Standard](https://sticker.how/#type-hexagon).

For the purposes of {hext}, the standard is:

0.  2 spaces, 8 underscores.
1.  1 space, 1 slash, 8 spaces, 1 backslash.
2.  1 slash, 10 spaces, 1 backslash.
3.  1 backslash, 10 spaces, 1 slash.
4.  1 space, 1 backslash, 8 underscores, 1 slash.

## A world beyond text?

If you’re interested in jpegs or whatever, see:

- [{hexSticker}](https://github.com/GuangchuangYu/hexSticker) by
  Guangchang Yu
- [hexmake](https://github.com/ColinFay/hexmake) by Colin Fay
- [{bunny}](https://github.com/dmi3kno/bunny) by Dmytro Perepolkin
- [{gex}](https://github.com/matt-dray/gex) by Matt Dray (disclaimer:
  that’s my name)
