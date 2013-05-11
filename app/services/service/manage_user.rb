module Service
  class ManageUser
    attr_accessor :user_params, :profile_params

    def initialize(user_params, profile_params)
      @user_params = user_params
      @profile_params = profile_params
    end

    def create
      user = User.new(user_params)
      profile = user.build_profile(profile_params)
      ActiveRecord::Base.transaction do
        user.save!
        profile.save!
      end
      user
    end

    def update(user_id, profile_id)
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        profile = Profile.find(profile_id)
        user.update!(user_params)
        profile.update!(profile_params)
        user
      end
    end
  end
end
