# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Pangolin < Formula
  desc "Pangolin is a lightweight portable rapid development library for managing OpenGL display / interaction and abstracting video input."
  homepage "https://github.com/stevenlovegrove/Pangolin"
  url "https://github.com/stevenlovegrove/Pangolin/archive/master.zip"
  sha256 "4234a6d48d65bd3d34fd60b20c9b3207388fa9ba91d656d33cf81f66e49b6844"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "glew"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test test`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
