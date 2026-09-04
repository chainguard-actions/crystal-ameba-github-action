# Crystal file with a known linting issue
def example
  x = 1 # useless assignment - x is never used
  "done"
end

puts example
