class ReferencesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
    temp = params[:retrieve][:id]
    if temp == ""
      flash[:error] = "PMID cannot be blank."
      redirect_to root_path
    elsif !is_a_number?(temp)
      flash[:error] = "Invalid PMID."
      redirect_to root_path
    else
      entry = Bio::PubMed.query(params[:retrieve][:id]) # searches PubMed and get entry
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
    
    def is_a_number?(s)
      s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
    end
end
