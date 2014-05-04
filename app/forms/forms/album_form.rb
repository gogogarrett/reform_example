module Forms
  class AlbumForm < Reform::Form # FIXME: sub forms don't inherit FBM.

    model :album

    property :title

    collection :songs, populate_if_empty: lambda { |fragment, args| model.songs.build } do
      property :name
      validates :name, presence: true
    end

    validates :title, presence: true
  end
end
