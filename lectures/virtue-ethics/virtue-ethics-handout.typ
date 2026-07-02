// Compile: typst compile virtue-ethics-handout.typ
#import "@local/lecture-slides:0.1.0": handout
#import "virtue-ethics-data.typ": content

#show: handout.setup.with(
  title: "Virtue Ethics",
  subtitle: "Introduction to Philosophy",
  author: "Dr. Ridenour",
  date: "July 2, 2026",
  institution: "Department of Philosophy",
)

#content(handout.slide, handout.section-slide, handout.article-note)
