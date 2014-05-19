module Service
  class ManageAlbum
    def store(album)
      ActiveRecord::Base.transaction do
        album.songs.each { |song| song.user = save_user(song.user) }
        album.save
        album
      end
    end

    private

    def save_user(song_user)
      return unless song_user

      if song_user.id && User.exists?(song_user.id)
        song_user.save # update existing user
        return song_user
      end

      matching_user = User.find_by(first_name: song_user.first_name, last_name: song_user.last_name)
      return matching_user if matching_user # return matching user

      song_user.save # create new user
      song_user
    end
  end
end
