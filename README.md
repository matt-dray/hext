
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {hext}

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/matt-dray/hext/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/matt-dray/hext/actions/workflows/R-CMD-check.yaml)
[![format-check.yaml](https://github.com/matt-dray/hext/actions/workflows/format.yaml/badge.svg)](https://github.com/matt-dray/hext/actions/workflows/format.yaml)
[![jarl-check](https://github.com/matt-dray/hext/actions/workflows/lint.yaml/badge.svg)](https://github.com/matt-dray/hext/actions/workflows/lint.yaml)
[![Blog
posts](https://img.shields.io/badge/rostrum.blog-black?style=flat&labelColor=00ff00&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODdhoACgAJEAAAAAAP%2F%2F%2FwAAAAAAACH5BAlkAAIALAAAAACgAKAAAAL%2FlI%2BpywgPY5u02hQzuLz7r0nfSBohVKbqdT7rS7UbTMNyjR93zoNtX9sBh7EfcSU8Kh3GJSnpVEKjnCkVaL0WT1pps2vJgr1cp3gMPufU6Cs7%2BG233zS6nByK2u%2FEPTLO1%2BWnMhi4BjhUaAhXtqS4aIOIJQmJpvhYqXVJmbm42dgZ%2BpkXWjqqUWrKOYGZioc60urat9ogOzsJ2nGLy3Oa0VtVy3AmUzy8wMuCrHBsTErMjCH9pytszfQMG40dRk34bcKpDZ0cLqDs3V3hTI5ie57OHj%2FuLsJdvnv%2BRL%2BObv8O3zYP8rbku3YwG0BW%2FRLmcjjPH8CA5vwxtIjj172K%2FwvhYRQITE67gc0mzgC5seRHS%2FUkmrwI8d%2FKMSNDotQGk%2BS0mWlaxjR5kqNOhUMN1Uy5s%2BNNFx5j3jlKUaVSoTapIvXks6i4iTmrStXKByrTpca6XtWxz0xWr0ntmY3ali1Wl3SnfpWLlqeghkDdxkrriG9fcvz0ahI8%2BFlhpyIRJ9YIdy5jso%2FBvh2bCXLlyVYjG3W82XJT0XNAhz4bkTNN06cx6zPshnXrxaQzv1TLNZg6u7Ry6zboN7Dv36Pd6blNvDhh3LyTEzXOPLjzu8uFN58u83oPoNg7K44Ovfvz6q%2FCi0%2FRuuz5w%2Blhr6%2FWvvZ7RvHxzn9Y3%2FP97fnt7%2F8%2F1J9%2B%2F2UUoIAD1lGgawf6kmBQ54mlHmVrkUedgQTWJV2F30mIoX8A%2FoScdxGKCOFxHVIYF4rj4aSchfSBxV2LG5I4oYsInsgihyAOp6GDve2oXXYZppijiCYCOeSKM%2FZYInioCWkekzUuSaSCiUw5opQ4Uqmkj3tt6WVeQTbZCZk0gnlZmIGYqSWS%2FhX0IYxYslmlmmFhmSadXaqCpoxZ1pkmn24%2BGSNZgYqCp596iilfT33qKOejtknaZqSD2hgMhIsuaKSiiXKamqVJMuohqFtdyiWpT5p6qqhRAsrqoZC%2BCdh6mn4aa6ezElrrg3PimiusuwoIJ6I81nmre4L%2Fjtrqq10WW9qxz%2F6qrLFjhlhpqb8Veiaqf3bHbba8SotduMhSq1ov5k4LJrQskdusiqoW6Su8UMobL73qAnsupcJO6m2e%2FO5pravjXuuvZAYTi%2B2%2FPS5La7sDz2vlZwlT%2FC3GsgK8cMX5pvqxne5GcnHIm96LqaMBe1oyyh7f2fK6GvsJ8cEdZxzyxpWcLHPONBccsbc89%2FrjzQLHTPSVSNt78lMTm%2Fy0y3Y6vTTCK5cZdc9S6wzJ0ExHTfXV3Rr9c7TpEjzsy5pNfeHZM6ctsmlHNor22EHT%2FXZ5q5Ztt83a6qp3ynWLy7B7IzuM0M1N833E2keL%2FZrb6MnNMuSJPv9NsuRbV062D9V6rnmyli%2FzOceYIx7s5IYnnbrjqWeOt8%2Bvwxf75rODs3rpt7t%2Bu%2Bqhsx4s773TdvrgkBQAADs%3D)](https://www.rostrum.blog/index.html#category=hext)
<!-- badges: end -->

      ________
     /        \
    /   he     \
    \     xt   /
     \________/

## About

Hex stickers… but text.

An R package motivated by Yihui’s [‘Bye, hex
stickers’](https://yihui.org/en/2026/02/bye-stickers/) manifesto.

Inspired by artistry in [Yihui’s
{litedown}](https://github.com/yihui/litedown) and [Charlie’s
{secretbase}](https://github.com/shikokuchuo/secretbase/) packages.

## Install

This concept R package is a GitHub exclusive. Install like this, for
example:

``` r
install.packages("pak") # if not yet installed
pak::pak("matt-dray/hext")
```

Quality not guaranteed.

## Use

### Overview

There’s one function: `hext()`.

You can add text (`text_*`) and align it (`align_*`) for each of your
hex’s four writable lines (`*_1` to `*_4`). You cannot exceed the
allotted character width inside the hex border. You can colour the text
with one colour (`col`).

### Small example

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

### Alignment

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

### Colour

The `col` argument lets you colour all the text with one colour. See
details in `?hext` for full colour options. Colour is added [using ANSI
escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code), so the
exact visible colour is dependent on the viewer’s terminal.

``` r
# fmt: skip
hext::hext(
  "hello", "this", "is", "hext",
  "left", "right", "centre", "left",
  col = "yellow",
  print = FALSE
)
# [1] "\033[1;93m  ________\033[0m\n\033[1;93m /hello   \\\033[0m\n\033[1;93m/      this\\\033[0m\n\033[1;93m\\    is    /\033[0m\n\033[1;93m \\hext____/\033[0m"
```

Here’s a screenshot of the output viewed with zsh.

<img src="man/figures/README-hext-col.png" data-fig-align="left"
data-fig-alt="A text-hexagon logo printed to a zsh terminal. The text inside the hexagon says &#39;hello this is hext&#39;, with each word on a different line, aligned left, right, centre and left, respectively. The background is black and the text is bright yellow."
width="150" />

## Rendering disclaimer

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
  "L(  u u )",
  "_b___b",
  print = FALSE # return char vector invisibly
)
hext_cat |> cat()
#   ________
#  / /\__/\ \
# /={ o x o}=\
# \L(  u u ) /
#  \__b___b_/
```

## The Hext Logo Standard

You may be aware of the [the Stickers
Standard](https://sticker.how/#type-hexagon).

For the purposes of {hext}, the standard is (line-by-line):

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
