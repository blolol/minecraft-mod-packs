module ModPacks
  class ServerPackage < Package
    def human_readable_name
      'Server'
    end

    def type
      'server'
    end

    def write_zip
      zip(mod_jar_paths, path_prefix: 'mods')
      zip(config_path)
    end

    private

    def config_path
      pack.root.join('config').expand_path
    end

    def mod_jar_paths
      pack.server_jars.map(&:expand_path)
    end
  end
end
