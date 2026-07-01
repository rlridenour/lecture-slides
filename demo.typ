// Compile: typst compile demo.typ
#import "src/slides.typ": slides, slide, section-slide, article-note
#import "demo-data.typ": content

#show: slides.with(
  title: "Sample Lecture",
  subtitle: "Course Title",
  author: "Dr. Ridenour",
  date: "July 1, 2026",
  institution: "Department of Philosophy",
)

#content(slide, section-slide, article-note)
