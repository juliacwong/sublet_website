Rails.application.routes.draw do
  # Routes for the Housing listing resource:

  # CREATE
  get("/housing_listings/new", { :controller => "housing_listings", :action => "new_form" })
  post("/create_housing_listing", { :controller => "housing_listings", :action => "create_row" })

  # READ
  get("/housing_listings", { :controller => "housing_listings", :action => "index" })
  get("/housing_listings/:id_to_display", { :controller => "housing_listings", :action => "show" })

  # UPDATE
  get("/housing_listings/:prefill_with_id/edit", { :controller => "housing_listings", :action => "edit_form" })
  post("/update_housing_listing/:id_to_modify", { :controller => "housing_listings", :action => "update_row" })

  # DELETE
  get("/delete_housing_listing/:id_to_remove", { :controller => "housing_listings", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
