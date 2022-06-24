{-# OPTIONS -Wall #-}

import IntegrationTesting

main :: IO ()
main =  do
    bazel <- setupTestBazel
    let p (stdout, _stderr) = lines stdout == ["420"]
     in
        outputSatisfy p (bazel ["run", "//:repl", "--", "-ignore-dot-ghci", "-e", "leaf"])
