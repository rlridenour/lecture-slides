// Compile: typst compile demo-handout.typ
#import "src/handout.typ": handout, slide, section-slide, article-note

#show: handout.with(
  title: "Sample Lecture",
  subtitle: "Course Title",
  author: "Dr. Ridenour",
  date: "July 1, 2026",
  institution: "Department of Philosophy",
)

#section-slide("Section")

#slide(title: "Slide 1")[
  - One
  - Two
  - Three
]

#article-note[
  These are more detailed notes that are only printed on a handout. The handout
  does not contain the speaker notes. The handout does contain a small
  representation of the slide with the detailed handout notes below the slide
  contents.
]

#slide(title: "Slide 2")[
  + First
  + Second
  + Third
]

#article-note[
  These are the handout notes for slide 2. These notes can extend over multiple
  paragraphs with no limits on length.

  Donec id elit non mi porta gravida at eget metus. Donec id elit non mi porta
  gravida at eget metus. Vestibulum id ligula porta felis euismod semper. Lorem
  ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dolor id nibh
  ultricies vehicula ut id elit. Vivamus sagittis lacus vel augue laoreet rutrum
  faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum.

  Donec id elit non mi porta gravida at eget metus. Donec id elit non mi porta
  gravida at eget metus. Vestibulum id ligula porta felis euismod semper. Lorem
  ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dolor id nibh
  ultricies vehicula ut id elit. Vivamus sagittis lacus vel augue laoreet rutrum
  faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum.
]
