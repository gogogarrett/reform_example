module Workflows
  class AlbumWorkflow
    attr_reader :form, :params

    def initialize(form, params)
      @form = form
      @params = params
    end

    def process
      return unless form.validate(params)

      form.save do |form, map|
        album = form.model
        album_manager = ::Service::ManageAlbum.new(params)
        album = album.new_record? ? album_manager.create : album_manager.update(album.id)
        yield album if block_given?
        album
      end
    end
  end
end
