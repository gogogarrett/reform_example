module Forms
  class AlbumForm < Reform::Form # FIXME: sub forms don't inherit FBM.

    model :album

    property :title

    collection :songs do
      property :name
      validates :name, presence: true
    end

    validates :title, presence: true

    # dynamically added songs workaround
    def empty_song
      model.songs.build
    end
  end
end
