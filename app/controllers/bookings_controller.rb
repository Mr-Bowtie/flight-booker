class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = params[]
  end

  def create
  end
end
