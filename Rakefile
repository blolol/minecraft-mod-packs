require 'pathname'

desc 'Create a Prism Launcher instance zip archive'
task :prism, [:pack] do |task, args|
  pack = Blolol::ModPack.find_by_slug(args.pack)

  unless pack
    valid_pack_slugs = Blolol::ModPack.all.map(&:slug).sort.join(', ')
    $stderr.puts "#{args.pack.inspect} is not a valid pack slug! Valid names: #{valid_pack_slugs}"
    exit 1
  end

  if pack.package_prism_instance
    puts "✅ #{pack.prism_instance_package_relative_path}"
  else
    puts "❌ Error packaging Prism Launcher instance zip archive for #{pack.slug}."
  end
end

module Blolol
  class ModPack
    def self.all
      @all ||= root.children.select(&:directory?).map { |pack_root| new(pack_root) }
    end

    def self.find_by_slug(slug)
      slug.strip!
      all.find { |pack| pack.slug == slug }
    end

    def self.root
      @root ||= Pathname.new(File.join(File.dirname(__FILE__), 'packs'))
    end

    attr_reader :root

    def initialize(root)
      @root = root
    end

    def package_prism_instance
      prism_instance.package!
    end

    def prism_instance_package_relative_path
      prism_instance.package_path.relative_path_from(root.parent)
    end

    def slug
      root.basename.to_s
    end

    private

    def prism_instance
      @prism_instance ||= PrismInstance.new(self)
    end
  end

  class PrismInstance
    attr_reader :pack

    def initialize(pack)
      @pack = pack
    end

    def package!
      # Remove existing zip file to avoid updating it in place
      package_path.delete if package_path.exist?

      Dir.chdir(root.to_s) do
        puts `zip -r ../prism-instance . -i@manifest.txt`
      end

      $?.success?
    end

    def package_path
      pack.root.join('prism-instance.zip')
    end

    private

    def root
      @root ||= pack.root.join('prism-instance')
    end
  end
end
