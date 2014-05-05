module Forms
  class AlbumForm < Reform::Form # FIXME: sub forms don't inherit FBM.
    model :album

    property :title

    find_or_new_user = lambda do |fragment, args|
      if fragment[:id] && !fragment[:id].empty?
        User.find(fragment[:id])
      else
        User.find_by(first_name: fragment[:first_name], last_name: fragment[:last_name])
      end || User.new
    end

    collection :songs, populate_if_empty: lambda { |*| model.songs.build } do
      property :name

      property :user, populate_if_empty: find_or_new_user do
        property :first_name
        property :last_name
      end

      validates :name, presence: true
    end

    # this validation only gets triggered when params doesn't contain any songs attributes at all.
    validates :songs, :length => {minimum: 1} # yeah, album without any songs doesn't make sense.

    validates :title, presence: true
  end
end
