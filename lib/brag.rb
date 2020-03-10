#!/usr/bin/env ruby

class Brag
    DEFAULT_FILE = "#{ENV["HOME"]}/.bragsheet.txt".freeze

    def self.parse(args)
        if args.empty?
            return # don't do anything
        elsif args[0] == "sheet"
            read_file(DEFAULT_FILE)
            # print the list
        else
            brag_text = args.join(" ")
            add_to_file(DEFAULT_FILE, brag_text)
            puts "added '#{brag_text}' to your brag sheet"
        end
    end

    def self.add_to_file(file, text)
        open(file, 'a+') do |file|
          file.puts "#{Time.now.strftime("%m-%d-%y %H:%M")} - #{text}"
        end
    end

    def self.read_file(file)
        return puts "no brags yet :(" if no_brags?(file)

        puts "here's your brags"
        open(file, 'a+').each do |line|
            print "#{line}"
        end
    end

    def self.no_brags?(file)
        # if the file doesn't exist
        # if the file is empty
       !File.exists?(file) || File.zero?(file)
    end
end
