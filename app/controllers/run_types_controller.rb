class RunTypesController < AuthenticatedBaseController
  before_action :set_run_type, only: [:edit, :update, :destroy]
  before_action :set_run_types, only: [:edit, :index, :new]

  def index
  end

  def new
    @run_type = RunType.new
  end

  def edit
    @run_types = @run_types.where.not(id: @run_type.id)
  end

  def update
    if @run_type.update(run_type_params)
      redirect_to run_types_url, notice: 'Run type was successfully updated.'
    end
  end

  def create
    @run_type = RunType.new(run_type_params)

    if @run_type.save
      redirect_to run_types_url
    else
      render :new
    end
  end

private

  def set_run_type
      @run_type = RunType.find(params[:id])
  end

  def set_run_types
      @run_types = RunType.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def run_type_params
    params.require(:run_type).permit(:name, :heartrate)
  end
end
