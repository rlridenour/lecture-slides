// Compile: typst compile demo.typ
#import "@local/lecture-slides:0.1.0": slides
#import "demo-data.typ": content

#show: slides.setup.with(
  title: "Sample Lecture",
  subtitle: "Course Title",
  author: "Dr. Ridenour",
  date: "July 1, 2026",
  institution: "Department of Philosophy",
)

#content(slides.slide, slides.section-slide, slides.article-note)
