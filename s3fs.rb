module PoolParty
  class Plugins

    virtual_resource(:s3fs) do
      def loaded(opts={}, parent=self)
        has_package(:name => "build-essential")
        has_package(:name => "libcurl4-openssl-dev")
        has_package(:name => "libxml2-dev")
        has_package(:name => "libfuse-dev")

        has_exec(:name => "download-s3fs-src", 
                 :cwd => "/usr/local/src", 
                 :command => "curl --output /usr/local/src/s3fs-r177-source.tar.gz -0 http://s3fs.googlecode.com/files/s3fs-r177-source.tar.gz",
                 :ifnot => "test -f /usr/local/src/s3fs-r177-source.tar.gz")

        has_exec(:name => "extract-s3fs-src", 
                 :cwd => "/usr/local/src", 
                 :command => "tar -xvvf /usr/local/src/s3fs-r177-source.tar.gz",
                 :ifnot => "test -d /usr/local/src/s3fs",
                 :requires => get_exec("download-s3fs-src"))

        has_exec(:name => "compile-s3fs-src", 
                 :cwd => "/usr/local/src", 
                 :command => "make -C s3fs",
                 :ifnot => "test -f /usr/local/src/s3fs/s3fs",
                 :requires => get_exec("extract-s3fs-src"))

        has_exec(:name => "copy-s3fs-bin", 
                 :command => "cp /usr/local/src/s3fs/s3fs /usr/local/bin/s3fs",
                 :ifnot => "test -f /usr/local/bin/s3fs",
                 :requires => get_exec("compile-s3fs-src"))

        has_file({:name => "/etc/passwd-s3fs", 
                  :content => "#{access_key}:#{secret_access_key}}",
                  :mode => 600})
      end

      def bucket(name, mnt_point=nil)
        mnt_point ||= "/mnt/#{name}"
        has_directory(:name => mnt_point)
        has_exec(:name => "mount-s3fs-#{name}", 
                 :command => "/usr/local/bin/s3fs #{name} #{mnt_point}",
               # :ifnot => "test -f /usr/local/bin/s3fs", # when should we not do this?
                 :requires => get_exec("copy-s3fs-bin"))
      end
    end
    
  end
end