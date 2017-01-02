require 'pry'
# a program for seeing the zipfian distribution of a text.
require 'putsplus'
include Putsplus
require_relative 'zipfy/word_data.rb'

module Zipfy
    class Zipf 
        TAB = "\t"
        attr_reader :distribution
        attr_reader :total
        attr_reader :zipf_constant

        #Parses a file into an array of words
        def load_file file_path
            words = []
            File.open(file_path, 'r') do |f|
                words = f.read.to_s.split(/[\s,-]/)
            end
            words.each do |word|
                word.gsub!(/\W+/, '') #remove non characters
                word.downcase!
            end
            words.delete("") #remove blank entries
            words
        end

        #
        # sets instance var distribution to the distirubtion of the words set passed
        #
        def create_distribution words
            temp_hash = Hash.new(0)
            @distribution = []
            @total = 0
            @zipf_constant = nil

            words.each do |word|
                temp_hash[word] += 1
                @total += 1
            end
            temp_hash.keys.each do |k|
                @distribution << WordData.new(k, temp_hash[k])
            end
        end

        def sort_distribution
            @distribution = @distribution.sort_by {|wd| wd.frequency.to_i}
        end

        def calculate_zipfness
            calculate_zipf_constant unless @zipf_constant

            #zipf number is equal to freq * zipf_const/total
            # so call zipf_const/total 'z'
            z = @zipf_constant/@total.to_f
            length = @distribution.length

            @distribution.map do |d|
               d.zip_number = z * d.frequency
            end
        end

        def puts_distribution
            underline " "*6 + "Word Distirbution" + " "*6
            length = @distribution.length
            @distribution.each_with_index do |wd, i|
                tabs = 4 - (wd.word.length / 8).floor
                puts wd.word + (TAB * tabs).to_s + wd.frequency.to_s + TAB + (length - i).to_s + TAB + wd.zip_number.to_s
            end
        end

        def save_dist_to_file file_path, overwrite_file = false
            if File.exists?(file_path) && overwrite_file
                puts "Requires --force to overwrite existing file '#{file_path}'"
                exit
            end
        end

        def calculate_zipf_constant
            #this word has rank =1 , so its zipf factor should be 1/n = 1/1 = 1
            # so find its percentage and then multiply it up to one.

            #make the following true
            #freq of most common word / total words = 1 
            #by adding a constant to the right side
            # where constant = total words/ freq of most common word

            @zipf_constant = @total.to_f / @distribution.last.frequency.to_f
            @zipf_constant
        end

        #must calculate zipfness first
        def calculate_std_dev_from_reg
            #the zipfness should be equal to 1/rank. lets see the average deviatoin form that number
            length = @distribution.length
            deviations = []

            @distribution.each_with_index do |wd,i|
                theoretical = 1/(length - i).to_f
                actual = wd.zip_number
                deviation = (theoretical - actual).abs
                deviations << deviation
            end
            sum = 0.0
            deviations.each {|d| sum += d}
            (sum/length.to_f)
         end
    end
end
