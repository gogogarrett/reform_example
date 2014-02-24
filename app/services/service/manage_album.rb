module Service
  class ManageAlbum
    attr_accessor :params

    def initialize(params)
      @params = safe_params(params)
    end

    def create
      store { Album.new }
    end

    def update(album_id)
      store { Album.find(album_id) }
    end

    private

    def safe_params(params)
      ActionController::Parameters.new(params).permit!.reject { |key, value| %w{songs empty_song}.include?(key) }
    end

    def store
      ActiveRecord::Base.transaction do
        album = yield
        album.update!(params)
        album
      end
    end
  end
end
