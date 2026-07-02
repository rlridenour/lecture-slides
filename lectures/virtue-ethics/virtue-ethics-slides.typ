// Compile: typst compile virtue-ethics-slides.typ
#import "@local/lecture-slides:0.1.0": slides
#import "virtue-ethics-data.typ": content

#show: slides.setup.with(
  title: "Virtue Ethics",
  subtitle: "Introduction to Philosophy",
  author: "Dr. Ridenour",
  date: "July 2, 2026",
  institution: "Department of Philosophy",
)

#content(slides.slide, slides.section-slide, slides.article-note)
