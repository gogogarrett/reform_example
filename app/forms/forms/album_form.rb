Reform::Form.class_eval do
  include Reform::Form::ActiveModel::FormBuilderMethods
end

module Forms
  class AlbumForm < Reform::Form
    model :album

    property :title

    collection :songs do
      property :name
      validates :name, presence: true
    end

    validates :title, presence: true

    def save
      super
      model.save
    end
  end
end
