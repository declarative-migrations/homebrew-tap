class Dpm < Formula
  desc "Declarative PostgreSQL and CockroachDB schema migration"
  homepage "https://github.com/declarative-migrations/declarative-postgres-migrate.rs"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.1/dpm-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "a8f04e664de15407cecc2e203070592070b650631d0ceebf10651cd7cef2739c"
    else
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.1/dpm-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "317180bf65829ced6c6f43b78f564ecf0e1c52ec75ddbde7c449266e658ff879"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.1/dpm-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7778ce516a16b9aeef034f1d77b86eb71ee3c00d7476af76fd7a62c8ee95b8d4"
    else
      url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases/download/v0.3.1/dpm-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e92ff6ddc843e97b446a165d32dc1fe1df470cf12d0638988ef646e102638717"
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
