class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]

  # GET /lecturers
  # GET /lecturers.json
  def index
    #@lecturers = Lecturer.all
    @search=Lecturer.search(params[:q])
    @lecturers=@search.result
  end

  # GET /lecturers/1
  # GET /lecturers/1.json
  def show
  end

  # GET /lecturers/new
  def new
    @lecturer = Lecturer.new
  end

  # GET /lecturers/1/edit
  def edit
  end

  # POST /lecturers
  # POST /lecturers.json
  def create
    @lecturer = Lecturer.new(lecturer_params)

    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lecturer }
      else
        format.html { render action: 'new' }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecturers/1
  # PATCH/PUT /lecturers/1.json
  def update
    #raise params.inspect
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturers/1
  # DELETE /lecturers/1.json
  def destroy
    @lecturer.destroy
    respond_to do |format|
      format.html { redirect_to lecturers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecturer_params
      params.require(:lecturer).permit(:name, {:details => []}, :rate, :mykadno, :phone, :email, :position, :address, :qualifications, :experiences, :user_id, :college_id, {:data => []})
      #if you have problems with unpermitted parameters, use below instead of above.
      #params.require(:lecturer).permit!
    end
end
