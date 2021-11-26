require 'bundler/setup'
require 'archive/zip'
require 'aws-sdk-s3'
require 'base64'
require 'cgi/util'
require 'json'
require 'digest/md5'
require 'rake/clean'

$:.unshift('lib')
require 'mod_packs'

def pack(slug)
  ModPacks::Pack.new(slug, "packs/#{slug}")
end

def upload_to_s3(path)
  s3 = Aws::S3::Client.new
  bucket = 'minecraft'
  file_name = File.basename(path)
  key = File.join('modpacks', file_name)
  md5_digest = Digest::MD5.hexdigest(File.read(path))

  existing_object = begin
    s3.head_object(bucket: bucket, key: key, if_match: md5_digest)
    puts "Skipping #{file_name}, because it already exists in the #{bucket} S3 bucket"
  rescue Aws::S3::Errors::NotFound, Aws::S3::Errors::PreconditionFailed
    puts "Uploading #{file_name} to S3..."
    s3.put_object(acl: 'public-read', bucket: bucket, key: key, body: File.new(path))
  end

  "https://#{bucket}.s3.us-east-1.amazonaws.com/modpacks/#{CGI.escape(file_name)}"
end

def zip_file_path(slug, version, type)
  "build/#{slug}-#{version}-#{type}.zip"
end

CLOBBER.include('build/*')

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
task :release_client, [:slug] => :build_client do |task, args|
  pack = pack(args.slug)

  client_builds = [
    zip_file_path(pack.slug, pack.version, 'client-curseforge'),
    zip_file_path(pack.slug, pack.version, 'client-generic')
  ]

  client_builds.each do |zip_file|
    public_url = upload_to_s3(zip_file)
    puts public_url
  end
end

desc 'Release server package'
task :release_server, [:slug] => :build_server do |task, args|
  pack = pack(args.slug)
  zip_file = zip_file_path(pack.slug, pack.version, 'server')
  public_url = upload_to_s3(zip_file)
  puts public_url
end

desc 'Build client and server packages'
task :build, [:slug] => [:build_client, :build_server]

desc 'Build and release client and server packages'
task :release, [:slug] => [:release_client, :release_server]
