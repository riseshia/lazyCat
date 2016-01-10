# ApiController
class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!
  before_action :api_params, only: :index

  def index
    if params[:token]
      task = Task.find_by(token: params[:token])
      if task
        log = Log.create_with_param(params, task)
        render json: log.to_res
      else
        head :unprocessable_entity
      end
    else
      head :unprocessable_entity
    end
  end

  private

  def api_params
    params.permit(:token, :status, :message)
  end
end
