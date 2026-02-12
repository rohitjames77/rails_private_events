class UsersController <ApplicationController
 def index
  @users = User.all
 end
def show
    @user = User.find(params[:id])
    @attended_events = @user.attended_events
      end

  def events
    @events= current_user.events
  end
end
