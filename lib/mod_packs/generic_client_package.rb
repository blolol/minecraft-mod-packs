module ModPacks
  class GenericClientPackage < ClientPackage
    def human_readable_name
      'Client (Generic)'
    end

    def type
      'client-generic'
    end

    def write_zip
      zip(mod_jar_paths, path_prefix: 'mods')
      zip(other_paths)
    end

    private

    def other_paths
      paths_to_include_in_client_zip.map { |path| pack.root.join(path).expand_path }
    end
  end
end
