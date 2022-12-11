class TestPagesController < ApplicationController
  def show
    @my_model = MyModel.new
  end

  def update
    @my_model = MyModel.new(my_model_params)
    if @my_model.valid?
      flash[:notice] = "Text received: #{@my_model.field}"
      redirect_to test_page_path(page: params[:page] == '1' ? 2 : 1), status: :see_other
    else
      flash.now[:error] = 'The form contains invalid fields!'
      render :show, status: :unprocessable_entity
    end
  end

  private

  def my_model_params
    params.require(:my_model).permit(:field)
  end
end
