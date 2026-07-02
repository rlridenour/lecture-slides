// Compile: typst compile demo-handout.typ
#import "@local/lecture-slides:0.1.0": handout
#import "demo-data.typ": content

#show: handout.setup.with(
  title: "Sample Lecture",
  subtitle: "Course Title",
  author: "Dr. Ridenour",
  date: "July 1, 2026",
  institution: "Department of Philosophy",
)

#content(handout.slide, handout.section-slide, handout.article-note)
