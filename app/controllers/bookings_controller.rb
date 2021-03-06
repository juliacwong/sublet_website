class BookingsController < ApplicationController
  before_action :current_user_must_be_booking_sublessee, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_booking_sublessee
    booking = Booking.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == booking.sublessee
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Booking.ransack(params[:q])
    @bookings = @q.result(:distinct => true).includes(:sublessee, :housing).page(params[:page]).per(10)

    render("booking_templates/index.html.erb")
  end

  def show
    @booking = Booking.find(params.fetch("id_to_display"))

    render("booking_templates/show.html.erb")
  end

  def new_form
    @booking = Booking.new

    render("booking_templates/new_form.html.erb")
  end

  def create_row
    @booking = Booking.new

    @booking.sublessor_id = params.fetch("sublessor_id")
    @booking.sublessee_id = params.fetch("sublessee_id")
    @booking.payment_method = params.fetch("payment_method")
    @booking.housing_id = params.fetch("housing_id")
    @booking.booking_details = params.fetch("booking_details")

    if @booking.valid?
      @booking.save

      redirect_back(:fallback_location => "/bookings", :notice => "Booking created successfully.")
    else
      render("booking_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_housing_listing
    @booking = Booking.new

    @booking.sublessor_id = params.fetch("sublessor_id")
    @booking.sublessee_id = params.fetch("sublessee_id")
    @booking.payment_method = params.fetch("payment_method")
    @booking.housing_id = params.fetch("housing_id")
    @booking.booking_details = params.fetch("booking_details")

    if @booking.valid?
      @booking.save

      redirect_to("/housing_listings/#{@booking.housing_id}", notice: "Booking created successfully.")
    else
      render("booking_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @booking = Booking.find(params.fetch("prefill_with_id"))

    render("booking_templates/edit_form.html.erb")
  end

  def update_row
    @booking = Booking.find(params.fetch("id_to_modify"))

    @booking.sublessor_id = params.fetch("sublessor_id")
    
    @booking.payment_method = params.fetch("payment_method")
    @booking.housing_id = params.fetch("housing_id")
    @booking.booking_details = params.fetch("booking_details")

    if @booking.valid?
      @booking.save

      redirect_to("/bookings/#{@booking.id}", :notice => "Booking updated successfully.")
    else
      render("booking_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sublessee
    @booking = Booking.find(params.fetch("id_to_remove"))

    @booking.destroy

    redirect_to("/users/#{@booking.sublessee_id}", notice: "Booking deleted successfully.")
  end

  def destroy_row_from_housing
    @booking = Booking.find(params.fetch("id_to_remove"))

    @booking.destroy

    redirect_to("/housing_listings/#{@booking.housing_id}", notice: "Booking deleted successfully.")
  end

  def destroy_row
    @booking = Booking.find(params.fetch("id_to_remove"))

    @booking.destroy

    redirect_to("/bookings", :notice => "Booking deleted successfully.")
  end
end
