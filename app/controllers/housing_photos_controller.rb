class HousingPhotosController < ApplicationController
  before_action :current_user_must_be_housing_photo_photo_owner, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_housing_photo_photo_owner
    housing_photo = HousingPhoto.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == housing_photo.photo_owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @housing_photos = HousingPhoto.page(params[:page]).per(10)

    render("housing_photo_templates/index.html.erb")
  end

  def show
    @housing_photo = HousingPhoto.find(params.fetch("id_to_display"))

    render("housing_photo_templates/show.html.erb")
  end

  def new_form
    @housing_photo = HousingPhoto.new

    render("housing_photo_templates/new_form.html.erb")
  end

  def create_row
    @housing_photo = HousingPhoto.new

    @housing_photo.photo_caption = params.fetch("photo_caption")
    @housing_photo.photo_owner_id = params.fetch("photo_owner_id")
    @housing_photo.housing_id = params.fetch("housing_id")

    if @housing_photo.valid?
      @housing_photo.save

      redirect_back(:fallback_location => "/housing_photos", :notice => "Housing photo created successfully.")
    else
      render("housing_photo_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_housing_listing
    @housing_photo = HousingPhoto.new

    @housing_photo.photo_caption = params.fetch("photo_caption")
    @housing_photo.photo_owner_id = params.fetch("photo_owner_id")
    @housing_photo.housing_id = params.fetch("housing_id")

    if @housing_photo.valid?
      @housing_photo.save

      redirect_to("/housing_listings/#{@housing_photo.housing_id}", notice: "HousingPhoto created successfully.")
    else
      render("housing_photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @housing_photo = HousingPhoto.find(params.fetch("prefill_with_id"))

    render("housing_photo_templates/edit_form.html.erb")
  end

  def update_row
    @housing_photo = HousingPhoto.find(params.fetch("id_to_modify"))

    @housing_photo.photo_caption = params.fetch("photo_caption")
    
    @housing_photo.housing_id = params.fetch("housing_id")

    if @housing_photo.valid?
      @housing_photo.save

      redirect_to("/housing_photos/#{@housing_photo.id}", :notice => "Housing photo updated successfully.")
    else
      render("housing_photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_photo_owner
    @housing_photo = HousingPhoto.find(params.fetch("id_to_remove"))

    @housing_photo.destroy

    redirect_to("/users/#{@housing_photo.photo_owner_id}", notice: "HousingPhoto deleted successfully.")
  end

  def destroy_row_from_housing
    @housing_photo = HousingPhoto.find(params.fetch("id_to_remove"))

    @housing_photo.destroy

    redirect_to("/housing_listings/#{@housing_photo.housing_id}", notice: "HousingPhoto deleted successfully.")
  end

  def destroy_row
    @housing_photo = HousingPhoto.find(params.fetch("id_to_remove"))

    @housing_photo.destroy

    redirect_to("/housing_photos", :notice => "Housing photo deleted successfully.")
  end
end
