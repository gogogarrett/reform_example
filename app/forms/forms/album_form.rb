module Forms
  class AlbumForm < Reform::Form
    property :title

    collection :songs do
      property :name
    end

    def to_key
      [model.id]
    end

    def persisted?
      model.id.present?
    end

    def self.model_name
      ::ActiveModel::Name.new(self, nil, "Album")
    end

    def to_param
      model.id
    end

    def to_model
      self
    end

  end
end
