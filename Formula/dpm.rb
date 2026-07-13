class Dpm < Formula
  desc "Declarative, ORM-agnostic Postgres schema migration (diff two databases)"
  homepage "https://github.com/declarative-migrations/declarative-postgres-migrate.rs"
  url "https://github.com/declarative-migrations/declarative-postgres-migrate.rs/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "3d89d434a15380261181ac9a0c1506ba07e24c276e175d17e097287d19bd5707"
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
