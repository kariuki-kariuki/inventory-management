class AssetsController < ApplicationController
  skip_before_action :authorize
  def create
    new_asset = Asset.create!(asset_params)
    render json: new_asset, status: :created
  end

  def show
    asset = Asset.find_by(id: params[:id])
    render json: asset, status: :ok
  end

  def index
      render json: Asset.all, status: :ok
  end


  def assets_without_users
    assets = Asset.where(user_id: nil)
    render json: assets, status: :ok
  end

  def destroy 
    asset = find_asset(params[:id])
    asset.destroy
    head :no_content
  end
  private

  def find_asset(id)
    Asset.find_by(id: id)
  end

  def asset_params
    params.permit(:name, :description, :category)
  end
end
