class ReferencesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
    entry = Bio::PubMed.query(params[:retrieve][:PMID]) # searches PubMed and get entry
    medline = Bio::MEDLINE.new(entry)     # creates Bio::MEDLINE object from entry text
    reference = medline.reference
    @attr = { :abstract => reference.nature }
    @reference = Reference.new
    @reference = current_user.references.build(@attr) # converts into Bio::Reference object
    if @reference.save
      flash[:success] = "Reference created!"
        redirect_to root_path
      else
        @feed_items = []
        render 'pages/home'
    end
  end
 
  def destroy
    @reference.destroy
    redirect_back_or root_path
  end
  
  private

    def authorized_user
      @reference = Reference.find(params[:id])
      redirect_to root_path unless current_user?(@reference.user)
    end
end
