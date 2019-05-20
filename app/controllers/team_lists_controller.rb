class TeamListsController < ApplicationController
  before_action :set_team_list, only: [:show, :edit, :update, :destroy]

  # GET /team_lists
  # GET /team_lists.json
  def index
    @team_lists = TeamList.all
  end

  # GET /team_lists/1
  # GET /team_lists/1.json
  def show
  end

  # GET /team_lists/new
  def new
    @team_list = TeamList.new
  end

  # GET /team_lists/1/edit
  def edit
  end

  # POST /team_lists
  # POST /team_lists.json
  def create
    @team_list = TeamList.new(team_list_params)

    respond_to do |format|
      if @team_list.save
        format.html { redirect_to @team_list, notice: 'Team list was successfully created.' }
        format.json { render :show, status: :created, location: @team_list }
      else
        format.html { render :new }
        format.json { render json: @team_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_lists/1
  # PATCH/PUT /team_lists/1.json
  def update
    respond_to do |format|
      if @team_list.update(team_list_params)
        format.html { redirect_to @team_list, notice: 'Team list was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_list }
      else
        format.html { render :edit }
        format.json { render json: @team_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_lists/1
  # DELETE /team_lists/1.json
  def destroy
    @team_list.destroy
    respond_to do |format|
      format.html { redirect_to team_lists_url, notice: 'Team list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_list
      @team_list = TeamList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_list_params
      params.require(:team_list).permit(:team_id, :team_name, :score)
    end
end
