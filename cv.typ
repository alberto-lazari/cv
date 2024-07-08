#import "brilliant-CV/template.typ": *
#show: layout

#cvHeader(hasPhoto: false, align: center)

#let modules = (
  "education",
  "experience",
  "volunteering",
  "certifications",
  "honors",
  "skills",
)
#for module in modules {
  v(1.3em)
  autoImport(module)
  v(1.3em)
}

#cvFooter()
