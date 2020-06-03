# coding: utf-8

Gem::Specification.new do |spec|
  spec.name                    = "geek"
  spec.version                 = "0.1"
  spec.authors                 = ["CEE"]

  spec.summary                 = "geek summary"
  spec.homepage                = "https://github.com/geek_re_kr/geek-devops"
  spec.license                 = "MIT"

  # spec.metadata["plugin_type"] = "theme"

  # spec.files                   = `git ls-files -z`.split("\x0").select do |f|
  #   f.match(%r{^(assets|_(data|includes|layouts|sass)/|(LICENSE|README|CHANGELOG)((\.(txt|md|markdown)|$)))}i)
  # end

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
