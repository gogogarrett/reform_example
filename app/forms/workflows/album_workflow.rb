module Workflows
  class AlbumWorkflow
    attr_reader :form, :params

    def initialize(form, params)
      @form = form
      @params = params
    end

    def process
      return unless form.validate(params)

      album = ::Service::ManageAlbum.new.store(form.sync.model)
      yield album if block_given?
      album
    end
  end
end
