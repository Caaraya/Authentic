class SessionPagesController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_page_params[:email])
    if user && user.authenticate(session_page_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Nice!'
    else
      redirect_to new_session_page_path, notice: 'No way!'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Bye!'
  end

  private

  def session_page_params
    params.require(:session_page).permit(:email, :password)
  end
end
