class Zunit < Formula
  desc "Powerful testing framework for ZSH projects"
  homepage "https://zunit.xyz"
  url "https://github.com/zunit-zsh/zunit/archive/v0.8.2.tar.gz"
  sha256 "eb94dad722dc7e95395f6e4b6a3e2eea5f7fd487d807112582a73ed7c3b2e4a7"
  head "https://github.com/zunit-zsh/zunit.git", :branch => "next"

  devel do
    url "https://github.com/zunit-zsh/zunit/archive/v0.8.2.tar.gz"
    version "0.8.2"
    sha256 "eb94dad722dc7e95395f6e4b6a3e2eea5f7fd487d807112582a73ed7c3b2e4a7"
  end

  bottle :unneeded
  depends_on "molovo/revolver/revolver" => :run

  def install
    system "./build.zsh"
    bin.install "zunit"
    zsh_completion.install "zunit.zsh-completion" => "_zunit"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/zunit -v")
  end
end
