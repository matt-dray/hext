# hext default rendering snapshot

    Code
      hext("hello!", "this", "is", "hext", print = FALSE)
    Output
      [1] "  ________\n / hello! \\\n/   this   \\\n\\    is    /\n \\__hext__/"

# hext printed output snapshot

      ________
     / hello! \
    /   this   \
    \    is    /
     \__hext__/

# hext mixed alignment snapshot

    Code
      hext("hello!", "this", "is", "hext", align_1 = "left", align_2 = "right",
        align_3 = "centre", align_4 = "left", print = FALSE)
    Output
      [1] "  ________\n /hello!  \\\n/      this\\\n\\    is    /\n \\hext____/"

# hext manual underscore padding snapshot

    Code
      hext("R", "pkg", "test", "name__", print = FALSE)
    Output
      [1] "  ________\n /   R    \\\n/   pkg    \\\n\\   test   /\n \\_name___/"

# hext empty text snapshot

    Code
      hext(print = FALSE)
    Output
      [1] "  ________\n /        \\\n/          \\\n\\          /\n \\________/"

# hext max width content snapshot

    Code
      hext("12345678", "1234567890", "abcdefghij", "ABCDEFGH", print = FALSE)
    Output
      [1] "  ________\n /12345678\\\n/1234567890\\\n\\abcdefghij/\n \\ABCDEFGH/"

