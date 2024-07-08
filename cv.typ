#import "brilliant-CV/template.typ": *
#show: layout

#cvHeader(hasPhoto: false, align: center)

#let modules = (
  "education",
  "experience",
  "volunteering",
  "certifications",
  "skills",
)
#for module in modules {
  v(1.5em)
  autoImport(module)
  v(1.5em)
}

#cvFooter()
