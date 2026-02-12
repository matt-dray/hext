
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

[Bye, hex stickers](https://yihui.org/en/2026/02/bye-stickers/). Welcome
back Yihui.

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

You can add (`text_*`) and align (`align_*`) text on each of your hex’s
four lines (`*_1` to `*_4`).

To make this package’s logo:

``` r
# fmt: skip
hext::make_hext(
  line_2 = "⬡⬢", align_2 = "centre",
  line_3 = "hext", align_3 = "centre"
)
#   ________
#  /        \
# /    ⬡⬢    \
# \   hext   /
#  \________/
```

A more complex example:

``` r
# fmt: skip
hext::make_hext(
  " hello", "this ", "is", "_hext", # space/underscore infill
  "left", "right", "centre", "left"
)
#   ________
#  / hello  \
# /     this \
# \    is    /
#  \_hext___/
```

Your kilometreage may vary with non-[ASCII
characters](https://en.wikipedia.org/wiki/ASCII) like emojis. Text is
best. Doesn’t mean artistry is out of the question.

``` r
hex_cat <- hext::make_hext(
  r"{/\__/\}",
  "={ o x o}=",
  "l(  u u )",
  "_b___b",
  .cat = FALSE # return character vector invisibly
)
hex_cat |> cat()
#   ________
#  / /\__/\ \
# /={ o x o}=\
# \l(  u u ) /
#  \__b___b_/
```

## Sage advice

Keep it simple.

No, you didn’t hear me.

*Simpler*.

## The Text-Stickers Standard

You may be aware of the [the Stickers
Standard](https://sticker.how/#type-hexagon). Too complex.

Canoncially, the flat-bottomed text-hex is:

- \[2 spaces\]\[8 underscores\]
- \[1 space\]\[1 slash\]\[8 spaces\]\[1 backslash\]
- \[1 slash\]\[10 spaces\]\[1 backslash\]
- \[1 backslash\]\[10 spaces\]\[1 slash\]
- \[1 space\]\[1 backslash\]\[8 underscores\]\[1 slash\]

That’s four possible lines that can contain text.

Trailing spaces to ‘square-off’ are acceptable but unnecessary.

## Gallery

Please [raise a PR](https://github.com/matt-dray/hext/pulls) to add to
this illustrious gallery.

\#000001: [{litedown}](https://github.com/yihui/litedown) by Yihui Xie

    [Reproduction awaiting clearance]

\#000002: [{secretbase}](https://github.com/shikokuchuo/secretbase/) by
Charlie Gao

    [Reproduction awaiting clearance]

\#000003: [{hext}](https://github.com/matt-dray/hext/) by Matt Dray

      ________
     /        \
    /    ⬡⬢    \
    \   hext   /
     \________/

## Overcomplicated file-based hexes

If you’re interested in jpegs or whatever, see:

- [{hexSticker}](https://github.com/GuangchuangYu/hexSticker) by
  Guangchang Yu
- [hexmake](https://github.com/ColinFay/hexmake) by Colin Fay
- [{bunny}](https://github.com/dmi3kno/bunny) by Dmytro Perelpolkin
- [{gex}](https://github.com/matt-dray/gex) by Matt Dray (disclaimer:
  that’s my name)
