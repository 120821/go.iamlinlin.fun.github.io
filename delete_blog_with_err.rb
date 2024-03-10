#!/usr/bin/env ruby

require 'open3'

loop do
  output, status = Open3.capture2e('bundle exec jekyll serve')

  puts "Output:"
  puts output

  error_file_matches = output.scan(/Liquid syntax error.*in\s+([^\n]+)/)
  error_files = error_file_matches.map { |match| match[0].chomp("\e[0m") }

  if error_files.empty?
    puts "No error files found. Exiting..."
    break
  end

  puts "Error files:"
  puts error_files.inspect

  error_files.each do |file|
    if File.exist?(file)
      File.delete(file)
      puts "Deleted file: #{file}"
    else
      puts "File not found: #{file}"
    end
  end
end
