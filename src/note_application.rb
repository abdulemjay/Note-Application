module Emjay
  class NotesApplication

    attr_reader :author
    attr_reader :notes

    def initialize(author)
      if author == ''
       raise "Please enter valid author name"
      elsif author.is_a? Integer
        raise "Please enter valid author name"
      elsif author.is_a? Float
        raise "Please enter valid author name"
      elsif author == nil
        raise "Please enter valid author name"
      elsif !author.is_a? String
        raise "Please enter valid author name"
      else
        @author = author
        @notes = []
      end    
    end
    
    def create(note_content)
      @notes << note_content
    end 
    
    def list
      @notes.each { |notecontent|
        puts "Note ID: #{@notes.index(notecontent)}\n#{notecontent}\n\nBy Author #{@author}\n\n"
      }
    end
    
    def get(note_id)
      if !note_id.is_a? Integer
        raise "Note ID should be an Integer"
      else            
        @notes[note_id]
      end 
    end

    def search(search_text)
      puts "Showing results for search #{search_text}\n"
      @notes.each do |notecontent|
        if notecontent.include?(search_text)
          puts "Note ID: #{@notes.index(notecontent)}\n#{notecontent}\n\nBy Author #{@author}\n"
        else
          raise "Search Keyword not found"
        end
      end
    end

    def delete(note_id)
      if !note_id.is_a? Integer
        raise "Note Id should be an Integer"
      else
        @notes.delete(@notes[note_id])
      end
    end

    def edit(note_id, note_content)
      if !note_id.is_a? Integer
        raise "Note Id should be an Integer"
      else   
        @notes[note_id] = note_content
      end
    end

  end
end
# end
