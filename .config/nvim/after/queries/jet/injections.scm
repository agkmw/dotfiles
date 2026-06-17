;; HTML as base
((text) @html)

;; Go template blocks: {{ ... }}
((text) @templ
  (#match? @templ "{{[\\s\\S]*?}}"))
