class HousingLikesController < ApplicationController
  before_action :current_user_must_be_housing_like_sublessee, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_housing_like_sublessee
    housing_like = HousingLike.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == housing_like.sublessee
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = HousingLike.ransack(params[:q])
    @housing_likes = @q.result(:distinct => true).includes(:sublessee, :housing).page(params[:page]).per(10)

    render("housing_like_templates/index.html.erb")
  end

  def show
    @housing_like = HousingLike.find(params.fetch("id_to_display"))

    render("housing_like_templates/show.html.erb")
  end

  def new_form
    @housing_like = HousingLike.new

    render("housing_like_templates/new_form.html.erb")
  end

  def create_row
    @housing_like = HousingLike.new

    @housing_like.sublessee_id = params.fetch("sublessee_id")
    @housing_like.housing_id = params.fetch("housing_id")

    if @housing_like.valid?
      @housing_like.save

      redirect_back(:fallback_location => "/housing_likes", :notice => "Housing like created successfully.")
    else
      render("housing_like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_housing_listing
    @housing_like = HousingLike.new

    @housing_like.sublessee_id = params.fetch("sublessee_id")
    @housing_like.housing_id = params.fetch("housing_id")

    if @housing_like.valid?
      @housing_like.save

      redirect_to("/housing_listings/#{@housing_like.housing_id}", notice: "HousingLike created successfully.")
    else
      render("housing_like_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @housing_like = HousingLike.find(params.fetch("prefill_with_id"))

    render("housing_like_templates/edit_form.html.erb")
  end

  def update_row
    @housing_like = HousingLike.find(params.fetch("id_to_modify"))

    
    @housing_like.housing_id = params.fetch("housing_id")

    if @housing_like.valid?
      @housing_like.save

      redirect_to("/housing_likes/#{@housing_like.id}", :notice => "Housing like updated successfully.")
    else
      render("housing_like_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sublessee
    @housing_like = HousingLike.find(params.fetch("id_to_remove"))

    @housing_like.destroy

    redirect_to("/users/#{@housing_like.sublessee_id}", notice: "HousingLike deleted successfully.")
  end

  def destroy_row_from_housing
    @housing_like = HousingLike.find(params.fetch("id_to_remove"))

    @housing_like.destroy

    redirect_to("/housing_listings/#{@housing_like.housing_id}", notice: "HousingLike deleted successfully.")
  end

  def destroy_row
    @housing_like = HousingLike.find(params.fetch("id_to_remove"))

    @housing_like.destroy

    redirect_to("/housing_likes", :notice => "Housing like deleted successfully.")
  end
end
