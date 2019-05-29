class InquiriesController < ApplicationController
  def index
    @inquiries = Inquiry.page(params[:page]).per(10)

    render("inquiry_templates/index.html.erb")
  end

  def show
    @inquiry = Inquiry.find(params.fetch("id_to_display"))

    render("inquiry_templates/show.html.erb")
  end

  def new_form
    @inquiry = Inquiry.new

    render("inquiry_templates/new_form.html.erb")
  end

  def create_row
    @inquiry = Inquiry.new

    @inquiry.sublessee_id = params.fetch("sublessee_id")
    @inquiry.sublessor_id = params.fetch("sublessor_id")
    @inquiry.housing_id = params.fetch("housing_id")
    @inquiry.inquiry_details = params.fetch("inquiry_details")

    if @inquiry.valid?
      @inquiry.save

      redirect_back(:fallback_location => "/inquiries", :notice => "Inquiry created successfully.")
    else
      render("inquiry_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_housing_listing
    @inquiry = Inquiry.new

    @inquiry.sublessee_id = params.fetch("sublessee_id")
    @inquiry.sublessor_id = params.fetch("sublessor_id")
    @inquiry.housing_id = params.fetch("housing_id")
    @inquiry.inquiry_details = params.fetch("inquiry_details")

    if @inquiry.valid?
      @inquiry.save

      redirect_to("/housing_listings/#{@inquiry.housing_id}", notice: "Inquiry created successfully.")
    else
      render("inquiry_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @inquiry = Inquiry.find(params.fetch("prefill_with_id"))

    render("inquiry_templates/edit_form.html.erb")
  end

  def update_row
    @inquiry = Inquiry.find(params.fetch("id_to_modify"))

    @inquiry.sublessee_id = params.fetch("sublessee_id")
    @inquiry.sublessor_id = params.fetch("sublessor_id")
    @inquiry.housing_id = params.fetch("housing_id")
    @inquiry.inquiry_details = params.fetch("inquiry_details")

    if @inquiry.valid?
      @inquiry.save

      redirect_to("/inquiries/#{@inquiry.id}", :notice => "Inquiry updated successfully.")
    else
      render("inquiry_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sublessee
    @inquiry = Inquiry.find(params.fetch("id_to_remove"))

    @inquiry.destroy

    redirect_to("/users/#{@inquiry.sublessee_id}", notice: "Inquiry deleted successfully.")
  end

  def destroy_row_from_housing
    @inquiry = Inquiry.find(params.fetch("id_to_remove"))

    @inquiry.destroy

    redirect_to("/housing_listings/#{@inquiry.housing_id}", notice: "Inquiry deleted successfully.")
  end

  def destroy_row
    @inquiry = Inquiry.find(params.fetch("id_to_remove"))

    @inquiry.destroy

    redirect_to("/inquiries", :notice => "Inquiry deleted successfully.")
  end
end
