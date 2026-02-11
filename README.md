# hext

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

> [!NOTE]
> Very much a concept that I may or may not develop in future.

```
  ________
 /        \
/    ⬢⬡    \
\   hext   /
 \________/
```

## About

Hex stickers... but text.

[Bye, hex stickers](https://yihui.org/en/2026/02/bye-stickers/).
Welcome back Yihui.

Inspired by artistry in [Yihui's {litedown}](https://github.com/yihui/litedown) and then [Charlie's {secretbase}](https://github.com/shikokuchuo/secretbase/).

## Install

GitHub exclusive.
```r
install.packages("pak") # if not yet installed
pak::pak("matt-dray/hext")
```

Like:

```r
hext::get_base() |> cat()
```
```
  ________
 /        \
/          \
\          /
 \________/
```

## Sage advice

Keep it simple.

No, you didn't hear me.

_Simpler_.

## Gallery

> [!NOTE]
> Please [raise a PR](https://github.com/matt-dray/hext/pulls) to add to this illustrious gallery.

\#000001: [{litedown}](https://github.com/yihui/litedown) by Yihui Xie

```
[Reproduction awaiting clearance]
```

\#000002: [{secretbase}](https://github.com/shikokuchuo/secretbase/) by Charlie Gao

```
[Reproduction awaiting clearance]
```

\#000003: [{hext}](https://github.com/matt-dray/hext/) by Matt Dray

```
  ________
 /        \
/    ⬢⬡    \
\   hext   /
 \________/
```

## The Yihui text-sticker standard

You may be aware of the [the Stickers Standard](https://sticker.how/#type-hexagon).
Too complex.

Canoncially, the flat-bottomed ASCII hex is:

* [2 spaces][8 underscores]
* [1 space][1 slash][8 spaces][1 backslash]
* [1 slash][10 spaces][1 backslash]
* [1 bacslash][10 spaces][1 slash]
* [1 space][1 backslash][8 underscores][1 slash]

Trailing spaces to 'square-off' are acceptable but unecessary.

## Complicated file-based hexes

If you're interested in jpegs or whatever, see:

* [{hexSticker}](https://github.com/GuangchuangYu/hexSticker) by Guangchang Yu
* [hexmake](https://github.com/ColinFay/hexmake) by Colin Fay
* [{bunny}](https://github.com/dmi3kno/bunny) by Dmytro Perelpolkin
* [{gex}](https://github.com/matt-dray/gex) by Matt Dray (disclaimer: that's my name)
