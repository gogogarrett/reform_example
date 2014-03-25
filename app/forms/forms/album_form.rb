module Forms
  class AlbumForm < Reform::Form # FIXME: sub forms don't inherit FBM.
    include Reform::Form::ActiveRecord

    model :album

    property :title

    collection :songs do
      property :name
      validates :name, presence: true
    end

    validates :title, presence: true

    def save
      super
      model.save  # Reform actually does this automatically now
      # But not this (see https://github.com/apotonick/reform/issues/73)
      songs.each do |song|
        song.model.save!
      end
    end
  end
end
