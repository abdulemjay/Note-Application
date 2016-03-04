# require 'codeclimate-test-reporter'
# CodeClimate::TestReporter.configure do |config|
#   config.path_prefix = "src" #the root of your Rails application relative to the repository root
#   #config.git_dir = "https://github.com/sheyooo/andela-project.git" #the relative or absolute location of your git root compared to where your tests are run
#   config.git_dir = `git rev-parse --show-toplevel`.strip
# end
# CodeClimate::TestReporter.start



require_relative 'note_application'


RSpec.describe "NotesApplication" do

  context "author of the note instantiation" do
    it "should test for empty author name" do
    expect {Emjay::NotesApplication.new("")}.to raise_error "Please enter valid author name"
    end    
      
    it "should test for integer" do
     expect {Emjay::NotesApplication.new(4)}.to raise_error "Please enter valid author name"
    end  

    it "should test for float" do
     expect {Emjay::NotesApplication.new(1.4)}.to raise_error "Please enter valid author name"
    end

    it "should test for nil" do
     expect {Emjay::NotesApplication.new(nil)}.to raise_error "Please enter valid author name"
    end

    it "should test for not a string" do
     expect {Emjay::NotesApplication.new([1,2,3])}.to raise_error "Please enter valid author name"
    end
  end

  context 'checks for several instances of initialize method' do 
    noteemjay = Emjay::NotesApplication.new("Emjay")
    notebukky = Emjay::NotesApplication.new("Bukky")
    noteyetty = Emjay::NotesApplication.new("Yetty")

    it 'should return author name Emjay' do
        expect(noteemjay.author).to eq 'Emjay'
    end

    it 'should reutrn author name Bukky' do
        expect(notebukky.author).to eq 'Bukky'
    end

    it 'should reutrn author name Yetty' do
        expect(noteyetty.author).to eq 'Yetty'
    end
  end

  context 'checks if notes is an instance property' do
    newnote = Emjay::NotesApplication.new("Emjay")
    it 'should returns notes list to be empty' do
        expect(newnote.list).to eq []
    end
  end

  context "checks if there are contents in the list" do
    newnote = Emjay::NotesApplication.new("Emjay")
    newnote.create("Amity is the crib!")
    it 'should returns the list with the contents' do
        expect(newnote.list).to eq ["Amity is the crib!"]
    end
  end

  context "Checks if method" do
    newauthor = Emjay::NotesApplication.new("Emjay")
    newauthor.create("Andela is all about Fellowship")
    newauthor.create("What an interesting Bootcamp")
    newauthor.create("Andela is wonderful")
    newauthor.create("Ruby is weird")

    it 'search should return the search keyword' do
    expect(newauthor.search("Andela")).to eq ["Andela is all about Fellowship", "What an interesting Bootcamp", "Andela is wonderful", "Ruby is weird"]
    end

    it 'returns name of author' do 
        expect(newauthor.author).to eq "Emjay"
    end

    it 'returns notes with index 0' do
        expect(newauthor.get(0)).to eq "Andela is all about Fellowship"
    end

    it 'returns notes with index 1' do
        expect(newauthor.get(1)).to eq "What an interesting Bootcamp"
    end

    it 'returns notes with index 2' do
        expect(newauthor.get(2)).to eq "Andela is wonderful"
    end

    it 'returns notes with index 3' do
        expect(newauthor.get(3)).to eq "Ruby is weird"
    end
    
    it 'should check if note_id is not an integer' do
        expect {newauthor.get("one")}.to raise_error "Note ID should be an Integer"
    end

    it 'edit returns error if get first parameter i.e note_id is not an integer' do 
        expect {newauthor.edit("zero","Who says Ruby is interesting")}.to raise_error "Note Id should be an Integer"
    end

    it 'edit edit the the note given the index and the new content' do
        expect {newauthor.edit(0,"Who says Ruby is interesting")}.to change {newauthor.get(0)}. from("Andela is all about Fellowship").to("Who says Ruby is interesting")
    end

    it 'delete raise error if note_id is a string' do
        expect {newauthor.delete("1")}.to raise_error "Note Id should be an Integer"
    end
    it 'delete delete note at index 2' do
        expect {newauthor.delete(3)}.to change {newauthor.notes.length}.from(4).to(3)
    end

    it 'set should return note at index 2' do
        expect(newauthor.get(2)).to eq "Andela is wonderful"
    end
  end

end
