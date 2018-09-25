class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    #if_the_left_side_is_true ? then_this_first_thing_happens : else_it's_the_second_thing
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
        if content != ""
          note = Note.create(content: content, song_id: self.id)
          self.notes << note
        end
    end
  end

  def note_contents
    contents = []
    if self.notes != []
      self.notes.each do |note|
        contents << note.content
      end
    else
      contents = []
    end
    contents
  end

end
