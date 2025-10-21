def 2d [input] {
  let content = if ($input | path exists) {
      open $input
  } else {
      $input
  }
  $content | split row ',' | split column '|'
}
