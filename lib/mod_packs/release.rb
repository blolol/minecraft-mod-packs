module ModPacks
  class Release
    GITHUB_REPO = 'blolol/minecraft-mod-packs'

    def initialize(pack, tag)
      @pack = pack
      @tag = tag
    end

    def create_github_draft
      github.create_release(GITHUB_REPO, tag, name: title, body: notes, draft: true,
        prerelease: prerelease?)
    end

    def notes
      <<~EOS
        ## Changes

        * Add changes here

        ## Packages

        * **Client (CurseForge):** #{curseforge_client_package.url}
          * MD5: `#{curseforge_client_package.zip_md5_digest}`
          * SHA-256: `#{curseforge_client_package.zip_sha256_digest}`
        * **Client (Generic):** #{generic_client_package.url}
          * MD5: `#{generic_client_package.zip_md5_digest}`
          * SHA-256: `#{generic_client_package.zip_sha256_digest}`
        * **Server:** #{server_package.url}
          * MD5: `#{server_package.zip_md5_digest}`
          * SHA-256: `#{server_package.zip_sha256_digest}`
      EOS
    end

    def title
      "#{pack.pack_name} #{pack.pack_version} (Minecraft #{pack.minecraft_version})"
    end

    private

    attr_reader :pack, :release, :tag

    def curseforge_client_package
      @curseforge_client_package ||= pack.curseforge_client_package
    end

    def generic_client_package
      @generic_client_package ||= pack.generic_client_package
    end

    def github
      @github ||= Octokit::Client.new(access_token: github_access_token)
    end

    def github_access_token
      ENV['GITHUB_TOKEN']
    end

    def prerelease?
      pack.pack_version.include?('-pre')
    end

    def server_package
      @server_package ||= pack.server_package
    end
  end
end
