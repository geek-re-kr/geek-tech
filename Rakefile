# require "bundler/gem_tasks"
require "jekyll"
# require "listen"

# require "bundler/setup"
require "tmpdir"
# require "rubygems"

# Auto publish
# Change your GitHub reponame
GITHUB_REPONAME = "geek-re-kr/geek-tech"

desc "Generate blog files"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
  system "jekyll b"
end

desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do
  Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp

    pwd = Dir.pwd
    Dir.chdir tmp

    system "git init"
    system "git add ."
  	message = "Site updated at #{Time.now.utc}"
  	system "git commit -m #{message.inspect}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master:gh-pages --force"

    Dir.chdir pwd
  end
end
