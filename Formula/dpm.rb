class Dpm < Formula
  desc "Declarative, ORM-agnostic Postgres schema migration (diff two databases)"
  homepage "https://github.com/declarative-migrations/declarative-postgres-migrate.rs"
  url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fe8fe24a4c6e8a7b2f4701269ebc8723273a93e716ac2855dada6fd3311628c0"
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
