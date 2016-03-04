require_relative 'src/note_application'

puts "Welcome! Please enter your name"
author = gets.chomp
note = Emjay::NotesApplication.new(author)
menu = true
while menu
  puts "\nEnter 1 to 7"
  puts "1 to create"
  puts "2 to list all note"
  puts "3 to output the note content of a note id"
  puts "4 to search for note containing a particular text"
  puts "5 to output the note content of a note id"
  puts "6 to edit a note with specified id"
  puts "7 to exit\n"

  input = gets.chomp.to_i
  
  case input 
    when 1
      puts "\nEnter content of note you want to create\n"   
      note_content = gets.chomp
      note.create(note_content)
           
    when 2
      note.list
  
    when 3
      puts "Enter id of note"
      note_id = gets.chomp.to_i
      puts note.get(note_id)
  
    when 4
      puts "Enter text to search"
      search_text = gets.chomp
      note.search(search_text)
  
    when 5
      puts "Enter id of note to be deleted"
      note_id = gets.chomp.to_i
      note.delete(note_id)
      puts "Note at index #{note_id} deleted"
  
    when 6
      puts "Enter id of note to be edited"
      note_id = gets.chomp.to_i
      puts "Enter content of note to be edited"
      note_content = gets.chomp
      note.edit(note_id, note_content)
  
    when 7
      menu= false

  end
    
end
