// Handout mode — slide content in bordered boxes with detailed notes below

/// Configure the document as a handout. Use as a show rule:
/// `#show: handout.setup.with(title: "...", author: "...", ...)`
#let setup(
  title: none,
  subtitle: none,
  author: none,
  date: none,
  institution: none,
  body,
) = {
  set page(paper: "us-letter", margin: (x: 1in, y: 1in))
  set text(font: "TeX Gyre Termes", size: 11pt, fallback: true)
  set par(justify: true, leading: 0.65em)
  set list(indent: 1em, body-indent: 0.5em)
  set enum(indent: 1em, body-indent: 0.5em)

  // Title block
  align(center)[
    #if title != none [ #text(size: 1.4em, weight: "bold")[#title] ]
    #if subtitle != none [ \ #text(size: 1.1em)[#subtitle] ]
    #if author != none [ #v(0.4em) #author ]
    #if institution != none [ \ #text(size: 0.9em, fill: luma(60))[#institution] ]
    #if date != none [ \ #text(size: 0.9em, fill: luma(60))[#date] ]
  ]

  v(1em)
  line(length: 100%, stroke: 0.5pt)
  v(0.8em)

  body
}

/// Slide content rendered in a bordered box. Speaker notes are suppressed.
/// `full-bleed: true` renders a fixed-height box (for images or centered text).
#let slide(title: none, note: [], full-bleed: false, body) = {
  v(0.6em)
  if full-bleed {
    block(
      width: 100%,
      height: 70mm,
      stroke: 0.5pt + luma(150),
      fill: white,
      clip: true,
    )[#body]
  } else {
    block(
      width: 100%,
      stroke: 0.5pt + luma(150),
      fill: white,
      inset: (x: 1em, y: 0.8em),
      radius: 2pt,
    )[
      #if title != none [
        #text(weight: "bold")[#title]
        #v(0.3em)
        #line(length: 100%, stroke: 0.3pt + luma(180))
        #v(0.4em)
      ]
      #body
    ]
  }
}

/// Section heading in handout mode.
#let section-slide(title) = {
  v(0.8em)
  text(size: 1.2em, weight: "bold")[#title]
  v(0.2em)
}

/// Detailed notes printed below the slide box. Suppressed in slides mode.
#let article-note(body) = {
  v(0.4em)
  body
  v(0.2em)
}
