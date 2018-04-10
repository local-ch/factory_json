require "bundler/gem_tasks"

ENV['gem_push'] = 'false' # Utilizes feature in bundler 1.3.0
# Let bundler's release task do its job, minus the push to Rubygems,
# and after it completes, use "gem inabox" to publish the gem to our
# internal gem server.
Rake::Task['release'].enhance do
  spec = Gem::Specification.load(Dir.glob("*.gemspec").first)
  sh "gem inabox pkg/#{spec.name}-#{spec.version}.gem"
end
