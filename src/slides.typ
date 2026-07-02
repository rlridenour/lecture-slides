// Slide presentation mode — 16:9 with speaker notes on second screen

#let _slide-w = 254mm
#let _slide-h = 143mm
#let _note-bg = luma(240)
#let _rule-color = luma(180)

#let _slide-box(body) = block(
  width: _slide-w,
  height: _slide-h,
  fill: white,
  clip: true,
  body,
)

#let _note-box(body) = block(
  width: _slide-w,
  height: _slide-h,
  fill: _note-bg,
  clip: true,
  body,
)

/// Configure the document as a slide presentation. Use as a show rule:
/// `#show: slides.setup.with(title: "...", author: "...", ...)`
#let setup(
  title: none,
  subtitle: none,
  author: none,
  date: none,
  institution: none,
  body,
) = {
  set page(
    width: _slide-w * 2,
    height: _slide-h,
    margin: 0pt,
  )
  set text(font: "Fira Sans", size: 12pt, fallback: true)
  set list(indent: 1em)
  set enum(indent: 1em)

  // Title slide
  grid(
    columns: (_slide-w, _slide-w),
    _slide-box[
      #place(center + horizon)[
        #align(center)[
          #pad(x: 2.5em)[
            #if title != none [
              #text(size: 1.6em, weight: "bold")[#title]
            ]
            #if subtitle != none [
              #v(0.3em)
              #text(size: 1.1em, fill: luma(80))[#subtitle]
            ]
            #v(1.5em)
            #if author != none [
              #text(size: 0.95em)[#author]
            ]
            #if institution != none [
              #v(0.2em)
              #text(size: 0.85em, fill: luma(60))[#institution]
            ]
            #if date != none [
              #v(0.2em)
              #text(size: 0.85em, fill: luma(60))[#date]
            ]
          ]
        ]
      ]
    ],
    _note-box[],
  )

  body
}

/// Individual slide. `note` appears on the right (second screen).
/// Place `article-note` calls after each slide for handout notes.
#let slide(title: none, note: [], body) = {
  pagebreak(weak: false)
  grid(
    columns: (_slide-w, _slide-w),
    _slide-box[
      #pad(x: 1.5em, top: 1em, bottom: 1em)[
        #if title != none [
          #block(below: 0.4em)[
            #text(size: 1.25em, weight: "bold")[#title]
          ]
          #line(length: 100%, stroke: 0.4pt + _rule-color)
          #v(0.5em)
        ]
        #body
      ]
    ],
    _note-box[
      #pad(1.2em)[
        #text(size: 0.8em)[#note]
      ]
    ],
  )
}

/// Section divider slide.
#let section-slide(title) = {
  pagebreak(weak: false)
  grid(
    columns: (_slide-w, _slide-w),
    _slide-box[
      #place(center + horizon)[
        #text(size: 1.5em, weight: "bold")[#title]
      ]
    ],
    _note-box[],
  )
}

/// Suppressed in slides mode — used only by the handout.
#let article-note(body) = {}
