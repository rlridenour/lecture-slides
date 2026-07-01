// Compile: typst compile demo.typ
#import "lib.typ": slides, slide, section-slide, article-note

#show: slides.with(
  title: "Sample Lecture",
  subtitle: "Course Title",
  author: "Dr. Ridenour",
  date: "July 1, 2026",
  institution: "Department of Philosophy",
)

#section-slide("Section")

#slide(title: "Slide 1", note: [
  - These are speaker notes.
  - They are displayed on a second screen.
  - They are viewed only by the person giving the presentation.
])[
  - One
  - Two
  - Three
]

#article-note[
  These are more detailed notes that are only printed on a handout. The handout
  does not contain the speaker notes. The handout does contain a small
  representation of the slide with the detailed handout notes below.
]

#slide(title: "Slide 2", note: [
  - Speaker notes for slide 2.
])[
  + First
  + Second
  + Third
]

#article-note[
  These are the handout notes for slide 2.
]
