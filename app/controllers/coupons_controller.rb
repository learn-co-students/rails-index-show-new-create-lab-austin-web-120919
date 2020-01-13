class CouponsController < ApplicationController

  before_action :find_coupon, only: :show
  before_action :coupon_params, only: :create

  def index
    @coupons = Coupon.all
  end

  def show
  end

  def new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.valid?
      @coupon.save
    else
      render 'new'
    end
    redirect_to coupon_path(@coupon)
  end


  private

    def find_coupon
      @coupon = Coupon.find(params[:id])
    end

    def coupon_params
      params.require(:coupon).permit(:coupon_code,:store)
    end

end
