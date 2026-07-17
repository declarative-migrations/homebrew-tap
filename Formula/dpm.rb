class Dpm < Formula
  desc "Declarative PostgreSQL and CockroachDB schema migration"
  homepage "https://github.com/declarative-migrations/declarative-postgres-migrate.rs"
  url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/archive/refs/tags/v0.3.1.tar.gz"
  version "0.3.1"
  sha256 "7e09d70f3552c5cf381d2a26ffdad25eb9fdb55b7e37b47862b7f14922bb6f8f"
  license "MIT"
  head "https://github.com/declarative-migrations/declarative-postgres-migrate.rs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    pkgshare.install ".cli-flags.toml"
  end

  test do
    assert_match "dpm", shell_output("#{bin}/dpm version")
    assert_match "declarative postgres migrate", shell_output("#{bin}/dpm help")
  end
end
