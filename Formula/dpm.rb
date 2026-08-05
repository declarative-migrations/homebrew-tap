class Dpm < Formula
  desc "Declarative PostgreSQL and CockroachDB schema migration"
  homepage "https://github.com/declarative-migrations/declarative-postgres-migrate.rs"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.2/dpm-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "acb81ea570ab602dd1facaab54c0f65be69837ff5e9e37fe5b0829c1a286cebe"
    else
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.2/dpm-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "7e91dcfb70ee9be3a5d7d30f03ab8630b0364cbb1e5056979edb1b386abdd468"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.2/dpm-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f876b606d48b06049d60554d617687710b0aa8c8bc643369cc06e20d1246f292"
    else
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.2/dpm-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4258755a946f6f3a49e33538889523e4736180624a186bddc90180994612d3aa"
    end
  end

  def install
    bin.install "dpm"
    pkgshare.install ".cli-flags.toml"
  end

  test do
    assert_match "dpm", shell_output("#{bin}/dpm version")
    assert_match "declarative postgres migrate", shell_output("#{bin}/dpm help")
  end
end
