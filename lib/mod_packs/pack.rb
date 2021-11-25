require 'pathname'
require 'set'
require 'yaml'

module ModPacks
  class Pack
    attr_reader :root, :slug

    def initialize(slug, root_path)
      @slug = slug
      @root = Pathname.new(File.expand_path(root_path))
    end

    def client_jars
      client_mods.map(&:jar)
    end

    def client_mods
      @client_mods ||= resolve_mods_and_dependencies(definition.dig('client', 'mods'))
    end

    def curseforge_manifest
      {
        minecraft: {
          version: definition['minecraft_version'],
          modLoaders: [{
            id: "#{definition['mod_loader']}-#{definition['mod_loader_version']}",
            primary: true
          }]
        },
        manifestType: 'minecraftModpack',
        manifestVersion: 1,
        name: definition['name'],
        version: version,
        author: 'Blolol',
        files: client_mods.map do |mod|
            {
              projectID: mod.curseforge_project_id,
              fileID: mod.curseforge_file_id,
              required: true
            }
          end,
        overrides: 'overrides'
      }
    end

    def mods
      @mods ||= Hash.new.tap do |mods|
        definition['mods'].each do |mod_slug, mod_definition|
          mods[mod_slug] = Mod.new(mod_slug, mod_definition, self)
        end
      end
    end

    def server_jars
      server_mods.map(&:jar)
    end

    def server_mods
      @server_mods ||= resolve_mods_and_dependencies(definition.dig('server', 'mods'))
    end

    def version
      definition['pack_version']
    end

    private

    def definition
      @definition ||= YAML.load(root.join('pack.yml').read)
    end

    def resolve_mods_and_dependencies(mod_slugs)
      mod_slugs.map do |mod_slug|
        if mod = mods[mod_slug]
          [mod, mod.dependencies]
        else
          raise "Couldn't find mod: #{mod_slug}"
        end
      end.flatten.uniq
    end
  end
end
