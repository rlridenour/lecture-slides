// Exposes two modules: slides and handout.
// Usage from external lecture directories:
//   #import "@local/lecture-slides:0.1.0": slides
//   #show: slides.setup.with(title: "...", ...)
//   #content(slides.slide, slides.section-slide, slides.article-note)
#import "src/slides.typ"
#import "src/handout.typ"
