# Pattern-Matching-Paths

## Overview
Pattern Matching Paths implements a solution, in Swift, for the following problem:

    You've been given two lists: the first is a list of patterns, the second
    is a list of slash-separated paths. Your job is to print, for each path,
    the pattern which best matches that path. ("Best" is defined more
    rigorously below, under "Output Format".)
    
    A pattern is a comma-separated sequence of non-empty fields. For a
    pattern to match a path, every field in the pattern must exactly match
    the corresponding field in the path. (Corollary: to match, a pattern and
    a path must contain the same number of fields.) For example: the pattern
    `x,y` can only match the path `x/y`. Note, however, that leading and
    trailing slashes in paths should be ignored, thus `x/y` and `/x/y/` are
    equivalent.
    
    Patterns can also contain a special field consisting of a *single
    asterisk*, which is a wildcard and can match any string in the path.

    For each path encountered in the input, print the *best-matching
    pattern*. The best-matching pattern is the one which matches the path
    using the fewest wildcards.
    
    If there is a tie (that is, if two or more patterns with the same number
    of wildcards match a path), prefer the pattern whose leftmost wildcard
    appears in a field further to the right. If multiple patterns' leftmost
    wildcards appear in the same field position, apply this rule recursively
    to the remainder of the pattern.

## Getting the repo

Clone the repo by running
```
git clone git@github.com:Killectro/Pattern-Matching-Paths.git
```

## Running the script

I modified the build output directory of the project so that it will output inside the project directory, so all you need to do to run the script is run the command
```
cat input_file_name.txt | ./Build/Products/Debug/PatternMatchingPaths > output_file_name.txt
```

## Building in Xcode

If you would rather build the executable yourself in Xcode you can open up the `.xcodeproj` file in Xcode and press `Command + B` to build a new version of the executable to the `Build/Products/Debug` directory.

## Extra Credit

The worst-case complexity of this algorithm is O(n<sup>2</sup>), or more specifically, O(N * M) where N is the number of patterns and M is the number of paths. However, the average complexity of the algorithm is significantly lower. First, the patterns are pre-sorted in descending order of their "bestness", as defined in the requirements. This means that we attempt to compare to the best patterns first, meaning that the first pattern we see that matches will be the best matching pattern. Combine this with the fact that the matching code skips any pattern that doesn't have the same number of components as the path, and in the average case the algorithm will trim a significant portion of the possible patterns.

The algorithm completes fairly quickly given a large input size due to the optimizations outlined above, but there is likely a faster solution that I didn't think of. One non-algorithmic speedup is that since each operation is independent once the input has been pre-sorted, the algorithm lends itself very well to being massively parallelized on a GPGPU. This would give huge speed increases without changing the algorithm.
