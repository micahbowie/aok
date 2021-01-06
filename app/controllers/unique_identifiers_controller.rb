class UniqueIdentifiersController < ApplicationController


  def create
    @id = UniqueIdentifier.new
    @id.generate_id
    flash[:new_id] = @id.unique_id
    redirect_to :new_unique_identifier
  end

  def show

    @act = Act.new
    @id = UniqueIdentifier.find_by(unique_id: params[:unique_id])
    @id_acts = @id.acts
  end

end
