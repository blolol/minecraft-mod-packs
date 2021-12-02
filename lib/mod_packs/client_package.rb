module ModPacks
  class ClientPackage < Package
    PATHS_TO_INCLUDE_IN_CLIENT_ZIP = %w(
      config
      options.justenoughkeys.txt
      options.txt
      resourcepacks
      shaderpacks
    )

    private

    def mod_jar_paths
      pack.client_jars.map(&:expand_path)
    end

    def paths_to_include_in_client_zip
      PATHS_TO_INCLUDE_IN_CLIENT_ZIP
    end
  end
end
