class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
    self.save
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
    self.save
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def note_contents=(content)
    content.each do |note_content|
      if note_content!= ""
        self.notes << Note.find_or_create_by(content: note_content)
      end
    end
  end


end
