#import "@preview/brilliant-cv:2.0.0": cv, cvSection, cvEntry, cvHonor, cvSkill, hBar

#let metadata = toml("/metadata.toml")

#let cv = cv.with(metadata)

#let section(text) = {
  cvSection(text, letters: text.split("").len() - 2, metadata: metadata)
  v(.2em)
}

#let modules(lang: metadata.language, ..args) = {
  for module in args.pos() {
    include {
      "modules_" + lang + "/" + module + ".typ"
    }
    v(.5em)
  }
}

// Better entry function
#let entry(
  location: none,
  description: none,
  tags: (),
  ..args
) = {
  if tags.len() > 0 {
    description = {
      description
      // Separate description from tags
      v(-.3em)
    }
  }
  cvEntry(
    location: location,
    description: description,
    tags: tags,
    metadata: metadata,
    ..args
  )
  v(-.5em)
}

#let honor(..args) = {
  v(eval(metadata.layout.at("before_entry_skip")))
  cvHonor(metadata: metadata, ..args)
}

#let skill(type: none, info: ()) = {
  v(eval(metadata.layout.at("before_entry_skip")))
  type = {
    set text(.9em)
    set par(leading: .5em)
    type
  }
  info = {
    set align(horizon)
    let spacing = .4em
    info.join([#h(spacing) | #h(spacing)])
  }

  cvSkill(type: type, info: info)
}
