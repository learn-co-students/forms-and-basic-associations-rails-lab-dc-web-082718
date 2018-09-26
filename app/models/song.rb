class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre
  belongs_to :artist
  accepts_nested_attributes_for :notes


  # def genre_name
  #   self.genre.name
  # end
  #
  # def genre_name=(name)
  #   self.genre.name = name
  # end

  def note_contents=(notes)


     # if self.notes.empty?
    notes.each { |bit|
     # byebug
    if !bit.empty?
      self.notes << Note.find_or_create_by(content: bit)
    end
    }

     # else
     #   self.notes.each { |note|
     #     Note.find_or_create_by(content: note.content)
     #   }
     # end
     # byebug
  end

  def note_contents
    self.notes ? self.notes.uniq!.collect { |note|
      note.content
    } : nil
  end

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def song_artist_name=(name)
     artist_name=(name)
  end

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_title=(title)
     self.title
  end

  def song_title
    self.title ? self.title : nil
  end

end
