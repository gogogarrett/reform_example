module Workflows
  class UserWorkflow
    attr_reader :form, :params

    def initialize(form, params)
      @form = form
      @params = params
    end

    def process
      if form.validate(params)
        form.save do |data, map|
          if form.user.new_record?
            user = ::Service::ManageUser.new(map[:user], map[:profile]).create
          else
            user = ::Service::ManageUser.new(map[:user], map[:profile]).update(form.user.id, form.profile.id)
          end

          yield user if block_given?
        end
      end
    end

  end
end
