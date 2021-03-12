# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class G2o < Formula
  desc "A General Framework for Graph Optimization"
  homepage "https://github.com/RainerKuemmerle/g2o"
  url "https://github.com/RainerKuemmerle/g2o/archive/20201223_git.tar.gz"
  version "20201223_git"
  sha256 "20af80edf8fd237e29bd21859b8fc734e615680e8838824e8b3f120c5f4c1672"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "suite-sparse"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "cmake", ".", *std_cmake_args, "-DCMAKE_BUILD_TYPE=Release",
                                          # "-DCMAKE_INSTALL_PREFIX=/usr/local",
                                          "-DCMAKE_CXX_FLAGS=-std=c++11",
                                          "-DBUILD_SHARED_LIBS=ON",
                                          "-DBUILD_UNITTESTS=OFF",
                                          "-DBUILD_WITH_MARCH_NATIVE=ON",
                                          "-DG2O_USE_CHOLMOD=OFF",
                                          "-DG2O_USE_CSPARSE=ON",
                                          "-DG2O_USE_OPENGL=OFF",
                                          "-DG2O_USE_OPENMP=ON"
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
