require 'bundler/setup'
require 'archive/zip'
require 'json'
require 'rake/clean'

$:.unshift('lib')
require 'mod_packs'

def pack(slug)
  ModPacks::Pack.new(slug, "packs/#{slug}")
end

def zip_file_path(slug, version, type)
  "build/#{slug}-#{version}-#{type}.zip"
end

task :build, [:slug] => [:build_client, :build_server]
task :release, [:slug] => [:release_client, :release_server]

CLOBBER.include('build/*.zip')

task :create_build_directory do
  mkdir_p 'build'
end

desc 'Build client packages'
task :build_client, [:slug] => [:build_client_curseforge, :build_client_generic]

desc 'Build CurseForge client package'
task :build_client_curseforge, [:slug] => :create_build_directory do |task, args|
  pack = pack(args.slug)

  tmp_dir = Pathname.new("build/#{args.slug}-#{pack.version}-client-curseforge")
  rm_rf tmp_dir
  mkdir_p tmp_dir

  tmp_dir.join('manifest.json').open('w') do |manifest|
    manifest.write(JSON.pretty_generate(pack.curseforge_manifest))
  end

  zip_file = zip_file_path(pack.slug, pack.version, 'client-curseforge')
  rm_f zip_file

  Archive::Zip.archive(zip_file, tmp_dir.join('manifest.json'))
  Archive::Zip.archive(zip_file, pack.root.join('config').expand_path, path_prefix: 'overrides')
end

desc 'Build generic client package'
task :build_client_generic, [:slug] => :create_build_directory do |task, args|
  pack = pack(args.slug)

  zip_file = zip_file_path(pack.slug, pack.version, 'client-generic')
  rm_f zip_file

  Archive::Zip.archive(zip_file, pack.client_jars.map(&:expand_path), path_prefix: 'mods')
  Archive::Zip.archive(zip_file, pack.root.join('config').expand_path)
end

desc 'Build server package'
task :build_server, [:slug] => :create_build_directory do |task, args|
  pack = pack(args.slug)

  zip_file = zip_file_path(pack.slug, pack.version, 'server')
  rm_f zip_file

  Archive::Zip.archive(zip_file, pack.server_jars.map(&:expand_path), path_prefix: 'mods')
  Archive::Zip.archive(zip_file, pack.root.join('config').expand_path)
end

desc 'Release client package'
task :release_client => :build_client do
  # TODO
end

desc 'Release server package'
task :release_server => :build_server do
  # TODO
end
