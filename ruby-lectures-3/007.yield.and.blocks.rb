
def do_three_times
  yield
  yield
  yield
end

do_three_times do
  puts "Hello"
end

# Build Iterators and Enumerators