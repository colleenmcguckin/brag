Gem::Specification.new do |s|
    s.name        = 'brag'
    s.version     = '0.1.1'
    s.licenses    = ['MIT']
    s.summary     = "A simple CLI to record accomplishments."
    s.description = "Perfect for keeping track of wins to reference later."
    s.authors     = ["Colleen McGuckin"]
    s.email       = 'colleenmcguckin@gmail.com'
    s.files       = ["lib/brag.rb", "bin/brag", "README.md"]
    s.homepage    = 'https://github.com/colleenmcguckin/brag_sheet'
    s.metadata    = { "source_code_uri" => "https://github.com/colleenmcguckin/brag_sheet" }
    s.executables << 'brag'
    s.require_paths = ["lib"]
  end