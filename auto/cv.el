(TeX-add-style-hook
 "cv"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10")
   (LaTeX-add-labels
    "contact"
    "research-themes"
    "education"
    "september-2013--"
    "october-2016---january-2017"
    "july---august-2016"
    "september-2012---september-2013"
    "september-2008---september-2012"
    "september-2010---september-2011"
    "awards-and-honours"
    "publications"
    "journal-articles"
    "proceedings-papers"
    "presentations"
    "refereed-conference-presentations"
    "invited-presentations"
    "other"
    "teaching"
    "professional-service"
    "languages"
    "technology-experience"
    "references"))
 :latex)
