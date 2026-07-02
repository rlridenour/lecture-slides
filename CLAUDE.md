# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository contains a custom Typst package that replicates a LaTeX Beamer workflow. It produces two outputs from a single source file:

- **Slides** (`src/slides.typ`): 16:9 PDF with slide content on the left half and speaker notes on the right half (for use with a second screen)
- **Handout** (`src/handout.typ`): US letter PDF with each slide rendered as a bordered box and detailed handout notes flowing below it

The `sample-lecture/` directory contains the original LaTeX/Org-mode source files being replicated.

## Package Structure

```
lib.typ                  # package entrypoint — exports slides and handout modules
src/
  slides.typ             # slides mode implementation
  handout.typ            # handout mode implementation
```

Import both modes as module objects from the package entrypoint:

```typst
#import "@local/lecture-slides:0.1.0": slides, handout
```

## Workflow

Each lecture lives in its own directory with three files:

**`lecture-data.typ`** — the single source of content, shared by both outputs:
```typst
#let content(slide, section-slide, article-note) = {
  section-slide("Section Title")

  slide(title: "Slide Title", note: [
    - Speaker notes (suppressed in handout)
  ])[
    - Slide content
  ]

  article-note[
    Detailed notes printed only in the handout.
  ]
}
```

**`lecture-slides.typ`** — slides wrapper:
```typst
#import "@local/lecture-slides:0.1.0": slides
#import "lecture-data.typ": content

#show: slides.setup.with(title: "...", subtitle: "...", author: "...", date: "...", institution: "...")

#content(slides.slide, slides.section-slide, slides.article-note)
```

**`lecture-handout.typ`** — handout wrapper:
```typst
#import "@local/lecture-slides:0.1.0": handout
#import "lecture-data.typ": content

#show: handout.setup.with(title: "...", subtitle: "...", author: "...", date: "...", institution: "...")

#content(handout.slide, handout.section-slide, handout.article-note)
```

Compile both outputs:

```sh
typst compile lecture-slides.typ
typst compile lecture-handout.typ
```

Watch for changes:

```sh
typst watch lecture-slides.typ
typst watch lecture-handout.typ
```

## API

All three functions (`slide`, `section-slide`, `article-note`) are defined in both `slides.typ` and `handout.typ` with the same signatures but different rendering behavior.

| Function | Slides mode | Handout mode |
|---|---|---|
| `slides.setup.with(...)` / `handout.setup.with(...)` | Sets double-wide page, Fira Sans font | Sets US letter page, serif font |
| `slide(title:, note:, full-bleed:)[body]` | Left half = content, right half = speaker notes | Bordered box with title + content; note suppressed |
| `section-slide(title)` | Full-width section divider slide | Bold section heading inline |
| `article-note[body]` | Suppressed | Paragraph text below the slide box |

### `full-bleed` slides

`slide(full-bleed: true)[body]` removes all padding from the slide content area. Use it for:

- **Full-height images**: `#image("file.jpg", height: 100%)` fills the slide panel. In handout mode, the box is fixed at 70mm tall so `height: 100%` resolves correctly.
- **Centered typographic slides**: combine with `#place(center + horizon)[...]` for a single prominent statement with no title.

Two-column layouts do not require `full-bleed` — use `#grid(columns: (1fr, 1fr), ...)` directly in the slide body.

## Local Installation

To use the package from any directory via `@local/lecture-slides:0.1.0`:

```sh
mkdir -p ~/Library/Application\ Support/typst/packages/local/lecture-slides
ln -s ~/github/lecture-slides ~/Library/Application\ Support/typst/packages/local/lecture-slides/0.1.0
```

## Demo Files

`demo-data.typ`, `demo.typ`, and `demo-handout.typ` in the repo root mirror the `sample-lecture/` content and serve as a working example of the workflow.
