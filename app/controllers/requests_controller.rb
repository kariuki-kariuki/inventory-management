class RequestsController < ApplicationController
  # skip_before_action: authorize_admin
  skip_before_action :authorize, only: [:create]

  def index
    # byebug
    if(@current_user.role == "Manager")
      render json: Request.all, status: :ok
    else
      requests = Request.where(user_id: @current_user.id).order("created_at DESC")
      render json: requests, status: :ok
    end
  end

  def create
    # byebugc
    req = Request.create({
      name: params[:name],
      category: params[:category],
      urgency: params[:urgency],
      asset_id: params[:asset_id],
      user_id: params[:user_id],
      quantity: params[:quantity],
      status: params[:status]
    })
    ActionCable.server.broadcast("requests", req )

    render json: req, status: :created
  end

  def show
    req = find_req
    render json: req, status: :ok
  end

  def destroy
    req = find_req
    req.destroy
    head :no_content
  end

  def update
    if(@current_user.role == "Manager" && params[:status] == "Approved")
      req = Request.find(params[:id])
      req.status = params[:status]
      req.asset.user_id = req.user_id
      req.asset.status = true
      req.save
      render json: req, status: :ok
    elsif(@current_user.role == "Manager" && params[:status] == "Rejected")
      req = Request.find(params[:id])
      req.status = params[:status]
      req.save
      render json: req, status: :ok
    else
      render json: {error: "You are not authrozed to perform this action"}, status: :unauthorized
    end
  end

  private
  def find_req
    Request.find_by(id: params[:id])
  end

  def requets_params
    params.permit(:name, :category, :status, :urgency, :asset_id, :user_id, :quantity, :id)
  end

  # def update_asset(user_id)
  #   asset = Asset.find_by(id: params[:asset_id])
  #   asset.user_id = params[:user_id]
  #   asset.status = true
  #   asset.save
  # end
end
