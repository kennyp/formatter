require 'rubygems'
require 'spec/rake/spectask'

specs  = FileList['spec/*_spec.rb']

task :default => :spec

desc 'Run all specs'
Spec::Rake::SpecTask.new("spec") do |t|
	t.spec_opts  = ["--format","specdoc","--color"]
	t.spec_files = specs
end
