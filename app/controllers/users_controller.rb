class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy, :export]
  before_filter :correct_user, :only => [:edit, :update, :export]
  before_filter :admin_user,   :only => :destroy
    
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
 
  def export
    response.headers['Content-Type'] = "application/vnd.word"
    response.headers['Content-Disposition'] = 'attachment; filename="references.doc"'
    response.headers['Cache-Control'] = ''
    @user = User.find(params[:id])
    @references = @user.references.find(:all)
    @references.sort! { |a,b| a.abstract.downcase <=> b.abstract.downcase }
    render 'export/export', :layout => false
  end
  
  def show
    @user = User.find(params[:id])
    @references = @user.references.paginate(:page => params[:page])
    @title = CGI.escapeHTML(@user.name)
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Reference Stacker!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
