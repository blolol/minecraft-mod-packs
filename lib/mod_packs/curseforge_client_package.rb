module ModPacks
  class CurseforgeClientPackage < ClientPackage
    def build
      write_curseforge_manifest
      super
    end

    def human_readable_name
      'Client (CurseForge)'
    end

    def type
      'client-curseforge'
    end

    def write_curseforge_manifest
      manifest_json = JSON.pretty_generate(pack.curseforge_manifest)
      curseforge_manifest_path.write(manifest_json)
    end

    def write_zip
      zip(curseforge_manifest_path)
      zip(override_paths, path_prefix: 'overrides')
    end

    private

    def curseforge_manifest_path
      build_dir.join('manifest.json')
    end

    def override_paths
      paths_to_include_in_client_zip.map do |path|
        pack.root.join(path).expand_path
      end
    end
  end
end
