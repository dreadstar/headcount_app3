class users::sessionsController < Devise::sessionsController
	layout "user"
  # def new
  #   super
  # end

	def destroy
     super
  end

  # def create
  #   super
  # end
end
