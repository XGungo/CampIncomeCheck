class AdminListsController < ApplicationController
  before_action :set_admin_list, only: [:show, :edit, :update, :destroy]

  # GET /admin_lists
  # GET /admin_lists.json
  def index
    @admin_lists = AdminList.all
  end

  # GET /admin_lists/1
  # GET /admin_lists/1.json
  def show
  end

  # GET /admin_lists/new
  def new
    @admin_list = AdminList.new
  end

  # GET /admin_lists/1/edit
  def edit
  end

  # POST /admin_lists
  # POST /admin_lists.json
  def create
    @admin_list = AdminList.new(admin_list_params)

    respond_to do |format|
      if @admin_list.save
        format.html { redirect_to @admin_list, notice: 'Admin list was successfully created.' }
        format.json { render :show, status: :created, location: @admin_list }
      else
        format.html { render :new }
        format.json { render json: @admin_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_lists/1
  # PATCH/PUT /admin_lists/1.json
  def update
    respond_to do |format|
      if @admin_list.update(admin_list_params)
        format.html { redirect_to @admin_list, notice: 'Admin list was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_list }
      else
        format.html { render :edit }
        format.json { render json: @admin_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_lists/1
  # DELETE /admin_lists/1.json
  def destroy
    @admin_list.destroy
    respond_to do |format|
      format.html { redirect_to admin_lists_url, notice: 'Admin list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_list
      @admin_list = AdminList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_list_params
      params.require(:admin_list).permit(:channel_id, :name)
    end
end
