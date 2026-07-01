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

Import by subpath for direct access to all functions:

```typst
#import "@local/lecture-slides:0.1.0/src/slides.typ": *
#import "@local/lecture-slides:0.1.0/src/handout.typ": *
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
#import "@local/lecture-slides:0.1.0/src/slides.typ": slides, slide, section-slide, article-note
#import "lecture-data.typ": content

#show: slides.with(title: "...", subtitle: "...", author: "...", date: "...", institution: "...")

#content(slide, section-slide, article-note)
```

**`lecture-handout.typ`** — handout wrapper:
```typst
#import "@local/lecture-slides:0.1.0/src/handout.typ": handout, slide, section-slide, article-note
#import "lecture-data.typ": content

#show: handout.with(title: "...", subtitle: "...", author: "...", date: "...", institution: "...")

#content(slide, section-slide, article-note)
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
| `slides.with(...)` / `handout.with(...)` | Sets double-wide page, Fira Sans font | Sets US letter page, serif font |
| `slide(title:, note:)[body]` | Left half = content, right half = speaker notes | Bordered box with title + content; note suppressed |
| `section-slide(title)` | Full-width section divider slide | Bold section heading inline |
| `article-note[body]` | Suppressed | Paragraph text below the slide box |

## Local Installation

To use the package from any directory via `@local/lecture-slides:0.1.0`:

```sh
mkdir -p ~/Library/Application\ Support/typst/packages/local/lecture-slides
ln -s ~/github/lecture-slides ~/Library/Application\ Support/typst/packages/local/lecture-slides/0.1.0
```

## Demo Files

`demo-data.typ`, `demo.typ`, and `demo-handout.typ` in the repo root mirror the `sample-lecture/` content and serve as a working example of the workflow.
