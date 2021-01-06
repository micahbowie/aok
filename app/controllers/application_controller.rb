class ApplicationController < ActionController::Base
  before_action :find_uid, only: [:index, :find]

  # def find
  #   byebug
  # end



  private
  def find_uid
   @uids = UniqueIdentifier.search(params[:search])
 end
end
