#!/usr/bin/env ruby
require 'date'

class Brag
    DEFAULT_FILE = "#{ENV["HOME"]}/.bragsheet.txt".freeze

    def self.parse(args)
        if args.empty?
            puts help_page
        elsif args[0] == "sheet"
            sheet(args)
        else
            brag_text = args.join(" ")
            add_to_file(DEFAULT_FILE, brag_text)
            puts "added '#{brag_text}' to your brag sheet"
        end
    end

    def self.add_to_file(file, text)
        open(file, 'a+') do |file|
          file.puts "#{Date.today} - #{text}"
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

    def self.sheet(args)
        case args[1]
        when "weekly"
            brags = []
            open(DEFAULT_FILE, 'a+').each do |line|
                # turn the timestamp into a date object
                brag_date = Date.parse(line.split(" ").first)
                if brag_date >= (Date.today - 6) # get the last week's brags (7 is inclusive friday - friday, we want monday-friday )
                    brags << line
                end
            end

            if brags.any?
                puts "here's your brags for the week:"
                puts brags
            else
                puts "no brags yet :("
            end
        else
            read_file(DEFAULT_FILE)
        end
    end

    def self.help_page
        "Usage: brag [ACCOMPLISHMENT]
Keep a list of accomplishments.\n
Pass in 'sheet' (ie: `brag sheet`)
to list your accomplishments.\n
Examples:
brag finished the mvp
brag sheet\n"
    end
end
