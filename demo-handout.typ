// Compile: typst compile demo-handout.typ
#import "src/handout.typ": handout, slide, section-slide, article-note
#import "demo-data.typ": content

#show: handout.with(
  title: "Sample Lecture",
  subtitle: "Course Title",
  author: "Dr. Ridenour",
  date: "July 1, 2026",
  institution: "Department of Philosophy",
)

#content(slide, section-slide, article-note)
