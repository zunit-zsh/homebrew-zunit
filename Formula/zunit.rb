class Zunit < Formula
  desc "Powerful testing framework for ZSH projects"
  homepage "https://zunit.xyz"
  url "https://github.com/zunit-zsh/zunit/archive/v0.8.0.tar.gz"
  sha256 "f4fcdc038e890673b9c793ade7fb2a5965ce618c51935f84021af6a413a6f602"
  head "https://github.com/zunit-zsh/zunit.git", :branch => "next"

  devel do
    url "https://github.com/zunit-zsh/zunit/archive/v0.8.0-beta2.tar.gz"
    version "0.8.0-beta2"
    sha256 "700079f9180434c814913a99cdc04038089bc0a5d845f3b1389901b39a4a6862"
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
