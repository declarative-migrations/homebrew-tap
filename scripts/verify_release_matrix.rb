#!/usr/bin/env ruby
# Fail closed if the formula points at incomplete or mismatched release artifacts.
formula = File.read(ARGV.fetch(0, "Formula/dpm.rb"))
urls = formula.scan(%r{https://github[.]com/declarative-migrations/declarative-postgres-migrate[.]rs/releases/download/v([0-9]+[.][0-9]+[.][0-9]+)/dpm-v([0-9]+[.][0-9]+[.][0-9]+)-([a-z0-9_-]+)[.]tar[.]gz})
expected = %w[aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu]
abort "exactly four distinct binary assets required" unless urls.length == 4 && urls.map(&:last).sort == expected.sort
abort "release URLs must use a single matching tag and filename version" unless urls.all? { |tag, filename, _| tag == filename } && urls.map(&:first).uniq.length == 1
digests = formula.scan(/^\s*sha256\s+"([a-f0-9]+)"\s*$/).flatten
abort "every asset requires a distinct SHA-256" unless digests.length == 4 && digests.all? { |sha| sha.length == 64 } && digests.uniq.length == 4
puts "release asset matrix: four targets, one pinned version, four unique SHA-256 values"
