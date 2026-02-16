
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
    /   he     \
    \     xt   /
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

Quality not guaranteed.

## Use

You can add text (`text_*`) and align it (`align_*`) for each of your
hex’s four writable lines (`*_1` to `*_4`). You cannot exceed the
allotted character width inside the hex border.

Here’s the simple logo for this package:

``` r
hext::hext(
  # You can adjust placement with spaces
  text_2 = "he  ",
  text_3 = "  xt"
)
#   ________
#  /        \
# /   he     \
# \     xt   /
#  \________/
```

Alignment defaults to centre, but you can change it:

``` r
# fmt: skip
hext::hext(
  "hello", "this", "is", "hext",
  "left", "right", "centre", "left"
)
#   ________
#  /hello   \
# /      this\
# \    is    /
#  \hext____/
```

Rendering is hard. Platforms and tools will vary in how they present the
same logo.

In particular, your kilometreage may vary with [Unicode
characters](https://en.wikipedia.org/wiki/List_of_Unicode_characters),
including emojis.

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

`hext()` defaults to assessing the display width of text. In the spirit
of fudging it, use `count_type = "chars"` to count characters instead.

[ASCII art](https://en.wikipedia.org/wiki/ASCII_art) is encouraged. Here
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
