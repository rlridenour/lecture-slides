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
      #layout(size => context {
        let text-block = {
          let items = ()
          if title != none { items.push(text(size: 1.8em, weight: "bold", title)) }
          if subtitle != none { items.push(text(size: 1.1em, weight: "bold", subtitle)) }
          items.push(1.2em)
          if author != none { items.push(text(size: 0.9em, author)) }
          if institution != none { items.push(text(size: 0.85em, institution)) }
          if date != none { items.push(text(size: 0.85em, date)) }
          pad(left: 2em, stack(dir: ttb, spacing: 0.25em, ..items))
        }
        let logo = pad(right: 2em, image("../school.png", height: 5em))
        let text-h = measure(text-block).height
        let logo-h = measure(logo).height
        place(top + left, dy: (size.height - text-h) / 2, text-block)
        place(top + right, dy: (size.height - logo-h) / 2, logo)
      })
    ],
    _note-box[],
  )

  body
}

/// Individual slide. `note` appears on the right (second screen).
/// `full-bleed: true` removes padding — use for images or centered text.
/// Place `article-note` calls after each slide for handout notes.
#let slide(title: none, note: [], full-bleed: false, body) = {
  pagebreak(weak: false)
  let slide-content = if full-bleed {
    _slide-box(body)
  } else {
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
    ]
  }
  grid(
    columns: (_slide-w, _slide-w),
    slide-content,
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
