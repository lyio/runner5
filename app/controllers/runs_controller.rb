class RunsController < AuthenticatedBaseController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :set_run_types, only: [:edit, :new, :index]

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run
              .own(current_user)
              .filter(params.slice(:type))
              .includes (:run_type)
    @grouped = @runs.group_by { |r| "#{r.date.strftime('%B %Y')}" }
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  # GET /runs/new
  def new
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)
    @run.user_id = current_user.id

    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    if @run.update(run_params)
      redirect_to @run, notice: 'Run was successfully updated.'
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = current_user.runs.find(params[:id])
    end

    def set_run_types
      @run_types = RunType.all.map { |type| [type.name, type.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:date, :resting_pulse, :weight, :name, :run_type_id, :pace, :heartrate, :duration, :distance, :weather, :remark)
    end
end
