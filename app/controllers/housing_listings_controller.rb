class HousingListingsController < ApplicationController
  before_action :current_user_must_be_housing_listing_sublessor, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_housing_listing_sublessor
    housing_listing = HousingListing.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == housing_listing.sublessor
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = HousingListing.ransack(params[:q])
    @housing_listings = @q.result(:distinct => true).includes(:sublessor, :housing_likes, :inquiries, :bookings, :housing_photos).page(params[:page]).per(10)

    render("housing_listing_templates/index.html.erb")
  end

  def show
    @housing_photo = HousingPhoto.new
    @booking = Booking.new
    @inquiry = Inquiry.new
    @housing_like = HousingLike.new
    @housing_listing = HousingListing.find(params.fetch("id_to_display"))

    render("housing_listing_templates/show.html.erb")
  end

  def new_form
    @housing_listing = HousingListing.new

    render("housing_listing_templates/new_form.html.erb")
  end

  def create_row
    @housing_listing = HousingListing.new

    @housing_listing.housing_type = params.fetch("housing_type")
    @housing_listing.city = params.fetch("city")
    @housing_listing.neighborhood = params.fetch("neighborhood")
    @housing_listing.number_of_guests = params.fetch("number_of_guests")
    @housing_listing.number_of_bedrooms = params.fetch("number_of_bedrooms")
    @housing_listing.number_of_bathrooms = params.fetch("number_of_bathrooms")
    @housing_listing.state = params.fetch("state")
    @housing_listing.country = params.fetch("country")
    @housing_listing.amenities = params.fetch("amenities")
    @housing_listing.description = params.fetch("description")
    @housing_listing.monthly_price = params.fetch("monthly_price")
    @housing_listing.sublessor_id = params.fetch("sublessor_id")
    @housing_listing.available_from = params.fetch("available_from")
    @housing_listing.available_till = params.fetch("available_till")
    @housing_listing.housing_photo_id = params.fetch("housing_photo_id")
    @housing_listing.sublessee_id = params.fetch("sublessee_id")
    @housing_listing.zip_code = params.fetch("zip_code")

    if @housing_listing.valid?
      @housing_listing.save

      redirect_back(:fallback_location => "/housing_listings", :notice => "Housing listing created successfully.")
    else
      render("housing_listing_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @housing_listing = HousingListing.find(params.fetch("prefill_with_id"))

    render("housing_listing_templates/edit_form.html.erb")
  end

  def update_row
    @housing_listing = HousingListing.find(params.fetch("id_to_modify"))

    @housing_listing.housing_type = params.fetch("housing_type")
    @housing_listing.city = params.fetch("city")
    @housing_listing.neighborhood = params.fetch("neighborhood")
    @housing_listing.number_of_guests = params.fetch("number_of_guests")
    @housing_listing.number_of_bedrooms = params.fetch("number_of_bedrooms")
    @housing_listing.number_of_bathrooms = params.fetch("number_of_bathrooms")
    @housing_listing.state = params.fetch("state")
    @housing_listing.country = params.fetch("country")
    @housing_listing.amenities = params.fetch("amenities")
    @housing_listing.description = params.fetch("description")
    @housing_listing.monthly_price = params.fetch("monthly_price")
    
    @housing_listing.available_from = params.fetch("available_from")
    @housing_listing.available_till = params.fetch("available_till")
    @housing_listing.housing_photo_id = params.fetch("housing_photo_id")
    @housing_listing.sublessee_id = params.fetch("sublessee_id")
    @housing_listing.zip_code = params.fetch("zip_code")

    if @housing_listing.valid?
      @housing_listing.save

      redirect_to("/housing_listings/#{@housing_listing.id}", :notice => "Housing listing updated successfully.")
    else
      render("housing_listing_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sublessor
    @housing_listing = HousingListing.find(params.fetch("id_to_remove"))

    @housing_listing.destroy

    redirect_to("/users/#{@housing_listing.sublessor_id}", notice: "HousingListing deleted successfully.")
  end

  def destroy_row
    @housing_listing = HousingListing.find(params.fetch("id_to_remove"))

    @housing_listing.destroy

    redirect_to("/housing_listings", :notice => "Housing listing deleted successfully.")
  end
end
