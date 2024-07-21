#import "/common.typ": *

// Treat headings as sections
#show heading.where(level: 1): it => section(it.body.text)

#show: cv
#import-modules(
  "education",
  "experience",
  "volunteering",
  "certifications",
  "honors",
  "skills",
)
