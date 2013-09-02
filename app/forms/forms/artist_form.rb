module Forms
  class ArtistForm < Reform::Form
    # include ::ActiveModel::Conversion
    # include Reform::Form::ActiveModel
    property :name
    validates :name, presence: true

    # def model_name
    #   ::ActiveModel::Name.new(self, nil, "Artist")
    # end

    def to_key
      [1]
    end

    def persisted?
      false
    end

  end
end
