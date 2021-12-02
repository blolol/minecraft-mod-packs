require 'bundler/setup'
require 'rake/clean'

$:.unshift('lib')
require 'mod_packs'

# `rake clobber` will delete these paths
CLOBBER.include('build/*')

def pack(slug)
  path = File.join(File.dirname(__FILE__), "packs/#{slug}")

  if File.directory?(path)
    ModPacks::Pack.new(slug, path)
  else
    raise ArgumentError, "Pack directory doesn't exist: #{path}"
  end
end

desc 'Build CurseForge client package'
task :build_client_curseforge, [:slug] do |task, args|
  pack(args.slug).curseforge_client_package.build_if_needed
end

desc 'Build generic client package'
task :build_client_generic, [:slug] do |task, args|
  pack(args.slug).generic_client_package.build_if_needed
end

desc 'Build client packages'
task :build_client, [:slug] => [:build_client_curseforge, :build_client_generic]

desc 'Build server package'
task :build_server, [:slug] do |task, args|
  pack(args.slug).server_package.build_if_needed
end

desc 'Upload CurseForge client package'
task :upload_client_curseforge, [:slug] => :build_client_curseforge do |task, args|
  pack(args.slug).curseforge_client_package.upload_if_needed
end

desc 'Upload generic client package'
task :upload_client_generic, [:slug] => :build_client_generic do |task, args|
  pack(args.slug).generic_client_package.upload_if_needed
end

desc 'Upload client packages'
task :upload_client, [:slug] => [:upload_client_curseforge, :upload_client_generic]

desc 'Upload server package'
task :upload_server, [:slug] => :build_server do |task, args|
  pack(args.slug).server_package.upload_if_needed
end

desc 'Build client and server packages'
task :build, [:slug] => [:build_client, :build_server]

desc 'Build and upload client and server packages'
task :upload, [:slug] => [:upload_client, :upload_server]

desc 'Draft GitHub release'
task :release, [:tag] do |task, args|
  slug = args.tag[%r{\A(.*?)/}, 1]
  release = pack(slug).release(args.tag)

  puts "# #{release.title}"
  puts
  puts release.notes
  puts

  if ENV['GITHUB_TOKEN']
    github_draft_release = release.create_github_draft
    puts "Drafted GitHub release: #{github_draft_release.html_url}"
  else
    puts 'Skipping GitHub release because GITHUB_TOKEN is not set'
  end
end
