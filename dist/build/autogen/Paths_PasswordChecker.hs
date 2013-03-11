module Paths_PasswordChecker (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/binroot/.cabal/bin"
libdir     = "/home/binroot/.cabal/lib/PasswordChecker-0.1.0.0/ghc-7.6.2"
datadir    = "/home/binroot/.cabal/share/PasswordChecker-0.1.0.0"
libexecdir = "/home/binroot/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "PasswordChecker_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "PasswordChecker_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "PasswordChecker_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "PasswordChecker_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
