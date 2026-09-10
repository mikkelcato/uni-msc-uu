#import "@preview/equate:0.3.2": equate

// physics
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8" as fletcher: cetz, diagram, edge, node
#import "@preview/inknertia:0.1.0": feynman

// theorem-styling
#import "@preview/lemmify:0.1.8": *
#import "@preview/showybox:2.0.4": showybox

#let thm-style(thm-type, name, number, body) = {
  if thm-type == "Theorem" {
    showybox(
      title-style: (
        weight: 1000,
        color: red.darken(40%),
        sep-thickness: 0pt,
      ),
      title: [Theorem
        #if name != none { [#text(weight: "regular")[(#name)]] }],

      frame: (
        border-color: red.darken(30%),
        title-color: red.lighten(80%),
        thickness: (left: 2pt),
        radius: 0pt,
      ),
    )[
      #body
    ]
  } else if thm-type == "Lemma" {
    showybox(
      title-style: (
        weight: 1000,
        color: blue.darken(40%),
        sep-thickness: 0pt,
      ),
      title: [Lemma
        #if name != none { [#text(weight: "regular")[(#name)]] }],

      frame: (
        border-color: blue.darken(30%),
        title-color: blue.lighten(80%),
        thickness: (left: 2pt),
        radius: 0pt,
      ),
    )[
      #body
    ]
  } else if thm-type == "Example" {
    showybox(
      title-style: (
        weight: 1000,
        color: black,
        sep-thickness: 0pt,
      ),
      title: [Example
        #if name != none { [#text(weight: "regular")[(#name)]] }],

      frame: (
        border-color: black,
        title-color: none,
        thickness: (left: 2pt),
        radius: 0pt,
      ),
    )[
      #body
    ]
  } else if thm-type == "Proposition" {
    showybox(
      title-style: (
        weight: 1000,
        color: green.darken(40%),
        sep-thickness: 0pt,
      ),
      title: [Proposition
        #if name != none { [#text(weight: "regular")[(#name)]] }],

      frame: (
        border-color: green.darken(30%),
        title-color: green.lighten(80%),
        thickness: (left: 2pt),
        radius: 0pt,
      ),
    )[
      #body
    ]
  } else if thm-type == "Corollary" {
    showybox(
      title-style: (
        weight: 1000,
        color: orange.darken(40%),
        sep-thickness: 0pt,
      ),
      title: [Corollary
        #if name != none { [#text(weight: "regular")[(#name)]] }],

      frame: (
        border-color: orange.darken(30%),
        title-color: orange.lighten(80%),
        thickness: (left: 2pt),
        radius: 0pt,
      ),
    )[
      #body
    ]
  } else if thm-type == "Definition" {
    showybox(
      title-style: (
        weight: 1000,
        color: purple.darken(60%),
        sep-thickness: 0pt,
      ),
      title: [Definition
        #if name != none { [#text(weight: "regular")[(#name)]] }],

      frame: (
        border-color: purple.darken(40%),
        title-color: none,
        thickness: (left: 2pt),
        radius: 0pt,
      ),
    )[
      #body
    ]
  } else if thm-type == "Exercise" {
    showybox(
      title-style: (
        weight: 1000,
        color: red.darken(40%),
        sep-thickness: 0pt,
      ),
      title: [Exercise #number
        #if name != none { [#text(weight: "regular")[(#name)]] }],

      frame: (
        border-color: red.lighten(20%),
        title-color: none,
        thickness: (left: 2pt),
        radius: 0pt,
      ),
    )[
      #body
    ]
  } else if thm-type == "Solution" {
    block(
      width: 100%,
      breakable: true,
    )[
      #align(left)[
        #text(weight: "regular", style: "italic")[Solution.]
        #h(0.5em)
        #body
      ]
    ]
  }
}


#let proof-style(thm-type, name, number, body) = block(
  width: 100%,
  breakable: true,
)[
  #align(left)[
    #text(weight: "regular", style: "italic")[Proof.]
    #h(0.5em)
    #body
    #h(1fr)
    $square$
  ]]




#let (
  theorem,
  lemma,
  corollary,
  proposition,
  example,
  definition,
  proof,
  rules: thm-rules,
) = default-theorems(
  "thms",
  thm-styling: thm-style,
  proof-styling: proof-style,
)

#let (
  exercise,
  sol,
  rules: exercise-rules,
) = new-theorems(
  "exercise-thms",
  (
    exercise: "Exercise",
    sol: "Solution",
  ),
  thm-styling: thm-style,
)

#let sol = sol.with(numbering: none)

/*
template for main (with title page)
*/

#let note(
  title: none,
  name: [],
  prof: [],
  body,
) = {
  // page
  set page(
    fill: white,
    paper: "a4",
  )

  // general text
  set text(
    size: 12pt,
    fill: black,
    font: "New Computer Modern", // LaTeX font
  )

  v(150pt)
  // title
  set align(center)
  text(size: 24pt, fill: black, title)

  v(15pt)

  par(justify: false)[
    #text(size: 12pt, [Notes taken by #name])
  ]

  v(50pt)
  // abstract
  par(justify: false)[
    #text(
      size: 12pt,
      [All errors are mine.],
    )
  ]

  pagebreak()

  set page(numbering: "1")

  // par
  set par(
    first-line-indent: 1.3em,
    leading: 1.3em,
    justify: true,
  )

  // headings
  set heading(
    numbering: "1.",
  )
  show heading: set block(below: 1.2em)
  show heading.where(level: 1): set text(18pt, black)
  show heading.where(level: 2): set text(14pt, black)

  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }

  set heading(
    numbering: (..x) => {
      let nums = x.pos()
      nums.at(0) = nums.at(0) - 1
      numbering("1.", ..nums)
    },
  )

  // outline
  show outline.entry.where(
    level: 1,
  ): set block(above: 1.5em)
  show outline.entry.where(
    level: 2,
  ): set block(above: 1.25em)
  outline(depth: 2)

  // figures
  set scale(reflow: true)
  show figure.caption: set text(size: 11pt, style: "italic")
  //show figure: set block(spacing: 1.3em)
  show ref.where(form: "normal"): set ref(supplement: it => {
    if it.func() == figure {
      "Figure"
    }
  })

  // enum
  set enum(
    indent: 1.3em,
    body-indent: 0.75em,
  )

  show enum: set block(breakable: true)
  show list: set block(breakable: true)

  // equations
  show math.equation: set text(font: "New Computer Modern Math")

  set math.equation(
    numbering: (..nums) => {
      let chapter = counter(heading.where(level: 1)).get().first() - 1
      numbering("(1.1)", chapter, nums.pos().first())
    },
  )

  show: equate.with(
    breakable: true,
    sub-numbering: false,
    number-mode: "label",
  )

  pagebreak()
  set align(left)

  show: thm-rules
  show: exercise-rules

  body
}

/*
template for lecture notes
*/

#let lect-note(
  title: none,
  name: [],
  prof: [],
  body,
) = {
  // page
  set page(
    fill: white,
    paper: "a4",
  )

  // general text
  set text(
    size: 12pt,
    fill: black,
    font: "New Computer Modern", // LaTeX font
  )

  v(150pt)
  // title
  set align(center)
  text(size: 24pt, fill: black, title)

  v(15pt)

  par(justify: false)[
    #text(size: 14pt, [Based on lectures by #prof])
  ]

  par(justify: false)[
    #text(size: 10pt, [Notes taken by #name])
  ]

  v(50pt)
  // abstract
  par(justify: false)[
    #text(
      size: 12pt,
      [These notes are not endorsed by the lecturers. All errors are mine.],
    )
  ]

  pagebreak()

  set page(numbering: "1")

  // par
  set par(
    first-line-indent: 1.3em,
    leading: 1.3em,
    justify: true,
  )

  // headings
  set heading(
    numbering: "1.",
  )
  show heading: set block(below: 1.2em)
  show heading.where(level: 1): set text(18pt, black)
  show heading.where(level: 2): set text(14pt, black)

  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }

  set heading(
    numbering: (..x) => {
      let nums = x.pos()
      nums.at(0) = nums.at(0) - 1
      numbering("1.", ..nums)
    },
  )

  // outline
  show outline.entry.where(
    level: 1,
  ): set block(above: 1.5em)
  show outline.entry.where(
    level: 2,
  ): set block(above: 1.25em)
  outline(depth: 2)

  // figures
  set scale(reflow: true)
  show figure.caption: set text(size: 11pt, style: "italic")
  //show figure: set block(spacing: 1.3em)
  show ref.where(form: "normal"): set ref(supplement: it => {
    if it.func() == figure {
      "Figure"
    }
  })

  // enum
  set enum(
    indent: 1.3em,
    body-indent: 0.75em,
  )

  show enum: set block(breakable: true)
  show list: set block(breakable: true)

  // equations
  show math.equation: set text(font: "New Computer Modern Math")

  set math.equation(
    numbering: (..nums) => {
      let chapter = counter(heading.where(level: 1)).get().first() - 1
      numbering("(1.1)", chapter, nums.pos().first())
    },
  )

  show: equate.with(
    breakable: true,
    sub-numbering: false,
    number-mode: "label",
  )

  pagebreak()
  set align(left)

  show: thm-rules
  show: exercise-rules

  body
}

/*
template for solutions
*/

#let solution(
  title: none,
  name: [],
  body,
) = {
  // page
  set page(
    fill: white,
    paper: "a4",
  )

  // general text
  set text(
    size: 12pt,
    fill: black,
    font: "New Computer Modern", // LaTeX font
  )

  v(150pt)
  // title
  set align(center)
  text(size: 24pt, fill: black, title)

  v(15pt)

  par(justify: false)[
    #text(size: 10pt, [Solutions by #name])
  ]

  pagebreak()

  set page(numbering: "1")

  // par
  set par(
    first-line-indent: 1.3em,
    leading: 1.3em,
    justify: true,
  )

  // headings
  set heading(
    numbering: "1.",
  )
  show heading: set block(below: 1.2em)
  show heading.where(level: 1): set text(18pt, black)
  show heading.where(level: 2): set text(14pt, black)

  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }
  set heading(
    numbering: (..x) => {
      let nums = x.pos()
      nums.at(0) = nums.at(0)
      numbering("1.", ..nums)
    },
  )

  // outline
  show outline.entry.where(
    level: 1,
  ): set block(above: 1.5em)
  show outline.entry.where(
    level: 2,
  ): set block(above: 1.25em)
  outline(depth: 2)

  // figures
  set scale(reflow: true)
  show figure.caption: set text(size: 11pt, style: "italic")
  //show figure: set block(spacing: 1.3em)
  show ref.where(form: "normal"): set ref(supplement: it => {
    if it.func() == figure {
      "Figure"
    }
  })

  // enum
  set enum(
    indent: 1.3em,
    body-indent: 0.75em,
  )

  show enum: set block(breakable: true)
  show list: set block(breakable: true)

  // equations
  show math.equation: set text(font: "New Computer Modern Math")

  set math.equation(
    numbering: (..nums) => {
      let chapter = counter(heading.where(level: 1)).get().first() - 1
      numbering("(1.1)", chapter, nums.pos().first())
    },
  )

  show: equate.with(
    breakable: true,
    sub-numbering: false,
    number-mode: "label",
  )

  pagebreak()
  set align(left)

  show: thm-rules
  show: exercise-rules

  body
}


/*
template for chapters (no title page, no outline, etc.)
*/

#let chpt-note(body) = {
  // page
  set page(
    fill: white,
    paper: "a4",
    numbering: "1",
  )

  // text and par
  set text(
    size: 12pt,
    fill: black,
    font: "New Computer Modern", // LaTeX font
  )

  set par(
    first-line-indent: 1.3em,
    leading: 1.3em,
    justify: true,
  )

  // headings
  set heading(
    numbering: (..x) => {
      let nums = x.pos()
      nums.at(0) = nums.at(0) - 1
      numbering("1.", ..nums)
    },
  )

  show heading: set block(below: 1.2em)
  show heading.where(level: 1): set text(18pt, black)
  show heading.where(level: 2): set text(14pt, black)

  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }

  // figures
  set scale(reflow: true)
  show figure.caption: set text(size: 11pt, style: "italic")
  //show figure: set block(spacing: 1.3em)
  show ref.where(form: "normal"): set ref(supplement: it => {
    if it.func() == figure {
      "Figure"
    }
  })

  // enums
  set enum(
    indent: 1.3em,
    body-indent: 0.75em,
  )

  show enum: set block(breakable: true)
  show list: set block(breakable: true)

  // equations
  show math.equation: set text(font: "New Computer Modern Math")
  set math.equation(
    numbering: (..nums) => {
      let chapter = counter(heading.where(level: 1)).get().first() - 1
      numbering("(1.1)", chapter, nums.pos().first())
    },
  )
  show: equate.with(
    breakable: true,
    sub-numbering: false,
    number-mode: "label",
  )

  set align(left)

  show: thm-rules
  show: exercise-rules

  body
}
