class MyCookbooksController < ApplicationController

  def show
    @user = current_user
    # show recipes that user has saved(=added to his cookbook) this week

    # show recipes that user has saved in the past (before this week)
  end

end
