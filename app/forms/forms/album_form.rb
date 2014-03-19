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
  end
end
