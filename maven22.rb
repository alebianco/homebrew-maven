class Maven22 < Formula
  desc "Java-based project management"
  homepage "https://maven.apache.org/"
  url "http://archive.apache.org/dist/maven/binaries/apache-maven-2.2.1-bin.tar.gz"
  sha256 "b9a36559486a862abfc7fb2064fd1429f20333caae95ac51215d06d72c02d376"

  conflicts_with "maven", :because => "Differing versions of same formula"

  depends_on :java

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]

    # Fix the permissions on the global settings file.
    chmod 0644, "conf/settings.xml"

    prefix.install_metafiles
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
