class admins::sessionsController < Devise::sessionsController
	layout "admin"
  # def new
  #  super
  # end

	# def destroy
  #   super
  # end

  # def create
  #  super
  # end
    def new
      super
    end

    def create
      
      super
    end

    def edit
      super
    end

    def update
      super
    end

    def destroy
      super
    end

    def cancel
      super
    end
end