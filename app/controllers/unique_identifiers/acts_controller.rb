class UniqueIdentifiers::ActsController < ApplicationController
  before_action :set_act, only: [:show, :edit, :update, :destroy]

  # GET /acts
  # GET /acts.json
  def index
    @acts = Act.all
  end

  # GET /acts/1
  # GET /acts/1.json
  def show
  end

  # GET /acts/new
  def new
    @unique_identifier = params[:unique_id]
    @act = Act.new
  end

  # GET /acts/1/edit
  def edit
  end

  # POST /acts
  # POST /acts.json
  def create
    # if UniqueIdentifier.find_by(unique_id: params[:uid_reference])?
    @uid = UniqueIdentifier.find_by(unique_id: params[:act][:uid_reference])
    @act = Act.new(act_params)
    @act.unique_identifier_id = @uid.id
    respond_to do |format|
      if @act.save
        format.html { redirect_to uid_act_path(@act), notice: 'Act was successfully created.' }
        format.json { render :show, status: :created, location: @act }
      else
        format.html { render :new }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acts/1
  # PATCH/PUT /acts/1.json
  def update
    respond_to do |format|
      if @act.update(act_params)
        format.html { redirect_to @act, notice: 'Act was successfully updated.' }
        format.json { render :show, status: :ok, location: @act }
      else
        format.html { render :edit }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acts/1
  # DELETE /acts/1.json
  def destroy
    @act.destroy
    respond_to do |format|
      format.html { redirect_to acts_url, notice: 'Act was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def act_params
      params.require(:act).permit(:uid_reference, :giver, :message, :instagram_username, :image)
    end
end
