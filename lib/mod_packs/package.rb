module ModPacks
  class Package
    BASE_URL = 'https://minecraft.s3.us-east-1.amazonaws.com'
    S3_BASE_PATH = 'modpacks'
    S3_BUCKET = 'minecraft'

    def initialize(pack)
      @pack = pack
    end

    def build
      write_zip
    end

    def build_if_needed
      build unless built?
    end

    def built?
      zip_path.exist?
    end

    def human_readable_name
      raise NotImplementedError, '#human_readable_name should be implemented by subclasses'
    end

    def type
      raise NotImplementedError, '#type should be implemented by subclasses'
    end

    def upload
      s3.put_object(acl: 'public-read', bucket: S3_BUCKET, key: s3_key, body: zip_path.open)
    end

    def upload_if_needed
      if uploaded?
        log('Skipping upload, because the package already exists on S3')
      else
        log('Uploading to S3... ', newline: false)
        upload
        log('done', prefix: false)
      end
    end

    def uploaded?
      s3.head_object(bucket: S3_BUCKET, key: s3_key, if_match: zip_md5_digest)
    rescue Aws::S3::Errors::NotFound, Aws::S3::Errors::PreconditionFailed
      false
    end

    def url
      "#{BASE_URL}/#{S3_BASE_PATH}/#{CGI.escape(zip_file_name)}"
    end

    def write_zip
      raise NotImplementedError, '#write_zip should be implemented by subclasses'
    end

    def zip_file_name
      "#{base_name_with_type}.zip"
    end

    def zip_md5_digest
      Digest::MD5.hexdigest(zip_path.read)
    end

    def zip_path
      build_dir.join(zip_file_name)
    end

    def zip_sha256_digest
      Digest::SHA256.hexdigest(zip_path.read)
    end

    private

    attr_reader :pack

    def base_name
      "#{pack.slug}-#{pack.version}"
    end

    def base_name_with_type
      "#{base_name}-#{type}"
    end

    def build_dir
      pack.root.join('../../build', base_name).tap(&:mkpath)
    end

    def log(message, newline: true, prefix: true)
      write_method = newline ? :puts : :print
      message.insert(0, "[#{base_name_with_type}] ") if prefix
      $stdout.public_send(write_method, message)
    end

    def s3
      @s3 ||= Aws::S3::Client.new
    end

    def s3_key
      "#{S3_BASE_PATH}/#{zip_file_name}"
    end

    def zip(paths, **options)
      Archive::Zip.archive(zip_path.to_s, paths, **options)
    end
  end
end
