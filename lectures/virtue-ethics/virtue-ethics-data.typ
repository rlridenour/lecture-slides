#let content(slide, section-slide, article-note) = {
  section-slide("Virtue Ethics")

  slide(title: "What Is Virtue Ethics?", note: [
    - Contrast with deontology (rules) and consequentialism (outcomes).
    - Aristotle asks: what kind of person should I be?
    - Virtue ethics is agent-centered, not act-centered.
  ])[
    - Developed by Aristotle in the *Nicomachean Ethics*
    - Focuses on *character* rather than rules or consequences
    - Central question: What kind of person should I be?
    - A *virtue* is a stable disposition to feel and act well
  ]

  article-note[
    Virtue ethics is one of the three major normative theories in ethics. Unlike
    deontology, which focuses on duties and rules, and consequentialism, which
    evaluates actions by their outcomes, virtue ethics centers on the character of
    the moral agent. Aristotle argued that ethics begins not with the question
    "What should I do?" but "What kind of person should I be?" A virtue, on his
    account, is not merely a habit of acting in certain ways but a stable
    disposition to feel, choose, and act appropriately across a range of
    situations.
  ]

  slide(title: "The Virtues and the Mean", note: [
    - Give examples: courage is the mean between cowardice and recklessness.
    - The mean is relative to the person and situation — not a mathematical midpoint.
    - Phronesis (practical wisdom) is the master virtue that guides the others.
  ])[
    - Virtues are the *mean* between two vices (excess and deficiency)
    - Example: courage lies between *cowardice* (deficiency) and *recklessness* (excess)
    - The mean is relative to the person and circumstances
    - *Phronesis* (practical wisdom) guides us to the right mean
  ]

  article-note[
    Aristotle's doctrine of the mean holds that each virtue is a middle ground
    between two corresponding vices — one of excess and one of deficiency. For
    example, generosity is the mean between miserliness and profligacy. Crucially,
    the mean is not a fixed mathematical midpoint but is relative to the individual
    and the situation. This is why practical wisdom (*phronesis*) is the
    architectonic virtue: it is the capacity to discern what the situation calls
    for and to respond accordingly. Without phronesis, the other virtues cannot
    be exercised well.
  ]

  slide(title: "Eudaimonia: The Good Life", note: [
    - Eudaimonia is often translated "happiness" but "flourishing" is more accurate.
    - It is an activity, not a feeling — you can't be eudaimon in a moment.
    - Raises the question: can virtuous people suffer misfortune and still flourish?
  ])[
    - The goal of a virtuous life is *eudaimonia* — human flourishing
    - Not mere pleasure or wealth, but living and doing well as a human being
    - Eudaimonia is an *activity* of the soul in accordance with virtue
    - Requires a complete life — not achievable in a single moment
  ]

  article-note[
    Eudaimonia, often translated as "happiness," is better rendered as
    "flourishing" or "living well." For Aristotle, eudaimonia is not a subjective
    feeling but an objective condition: it is the activity of the soul in
    accordance with virtue over a complete lifetime. This means that a person
    cannot flourish in isolation or in a single moment — flourishing requires the
    sustained exercise of virtues within a community. One classic objection is
    whether severe misfortune (poverty, illness, the death of loved ones) can
    undermine eudaimonia even in a virtuous person. Aristotle acknowledges that
    external goods matter, though he insists that virtue is the most important
    component of the good life.
  ]

  slide(title: "Virtue vs. Vice: Examples", note: [
    - Walk through each row and ask students to identify the virtuous mean.
    - Emphasize that the mean is situational, not a fixed rule.
  ])[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 2em,
      row-gutter: 0.6em,
      align: top,
      [*Deficiency*], [*Excess*],
      line(length: 100%), line(length: 100%),
      [Cowardice], [Recklessness],
      [Miserliness], [Profligacy],
      [Insensibility], [Self-indulgence],
      [Understatement], [Boastfulness],
    )
  ]

  article-note[
    This table illustrates Aristotle's doctrine of the mean across several
    virtues. The virtuous disposition — courage, generosity, temperance, and
    truthfulness — lies between a deficiency on the left and an excess on the
    right. Note that the corresponding virtues (courage, generosity, temperance,
    truthfulness) are not shown here; students are asked to supply them.
  ]

  slide(full-bleed: true, note: [
    - Pause here before moving on.
    - Aristotle's answer: yes, but only through practice and habituation, not instruction alone.
  ])[
    #place(center + horizon)[
      #text(size: 2.5em, weight: "bold")[Can virtue be taught?]
    ]
  ]

  article-note[
    This is one of the oldest questions in Greek ethics, raised in Plato's
    *Meno*. Aristotle's answer is nuanced: virtues cannot be taught the way
    mathematics is taught. They must be cultivated through habituation — by
    repeatedly performing virtuous actions until the disposition becomes stable
    and second nature.
  ]

  slide(full-bleed: true, note: [
    - Aristotle, 384–322 BCE.
    - Student of Plato; tutor of Alexander the Great.
    - Founded the Lyceum in Athens.
  ])[
    #align(center)[
      #image("aristotle.jpg", height: 100%)
    ]
  ]

  article-note[
    Aristotle studied at Plato's Academy for twenty years before founding his
    own school, the Lyceum. His surviving works on ethics — primarily the
    *Nicomachean Ethics* and the *Eudemian Ethics* — remain foundational texts
    in moral philosophy.
  ]
}
