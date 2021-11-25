require 'set'

module ModPacks
  class Mod
    attr_reader :definition, :pack, :slug

    def initialize(slug, definition, pack)
      @slug = slug
      @definition = definition
      @pack = pack
    end

    def <=>(other)
      slug <=> other.slug
    end

    def curseforge_file_id
      definition.dig('curseforge', 'file') || raise("Missing CurseForge file ID on #{slug}")
    end

    def curseforge_project_id
      definition.dig('curseforge', 'project') || raise("Missing CurseForge project ID on #{slug}")
    end

    def dependencies
      @dependencies ||= Array(definition['dependencies']).map do |dependency_slug|
        if dependency = pack.mods[dependency_slug]
          [dependency, dependency.dependencies]
        else
          raise "Couldn't find dependency of #{slug}: #{dependency_slug}"
        end
      end.flatten.uniq
    end

    def jar
      file_name = "#{slug}-#{version}.jar"
      root.join('mods', file_name)
    end

    private

    def root
      pack.root
    end

    def version
      definition['version']
    end
  end
end
