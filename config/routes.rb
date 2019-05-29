Rails.application.routes.draw do
  root :to => "housing_listings#index"
  # Routes for the Housing photo resource:

  # CREATE
  get("/housing_photos/new", { :controller => "housing_photos", :action => "new_form" })
  post("/create_housing_photo", { :controller => "housing_photos", :action => "create_row" })

  # READ
  get("/housing_photos", { :controller => "housing_photos", :action => "index" })
  get("/housing_photos/:id_to_display", { :controller => "housing_photos", :action => "show" })

  # UPDATE
  get("/housing_photos/:prefill_with_id/edit", { :controller => "housing_photos", :action => "edit_form" })
  post("/update_housing_photo/:id_to_modify", { :controller => "housing_photos", :action => "update_row" })

  # DELETE
  get("/delete_housing_photo/:id_to_remove", { :controller => "housing_photos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Housing like resource:

  # CREATE
  get("/housing_likes/new", { :controller => "housing_likes", :action => "new_form" })
  post("/create_housing_like", { :controller => "housing_likes", :action => "create_row" })

  # READ
  get("/housing_likes", { :controller => "housing_likes", :action => "index" })
  get("/housing_likes/:id_to_display", { :controller => "housing_likes", :action => "show" })

  # UPDATE
  get("/housing_likes/:prefill_with_id/edit", { :controller => "housing_likes", :action => "edit_form" })
  post("/update_housing_like/:id_to_modify", { :controller => "housing_likes", :action => "update_row" })

  # DELETE
  get("/delete_housing_like/:id_to_remove", { :controller => "housing_likes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Inquiry resource:

  # CREATE
  get("/inquiries/new", { :controller => "inquiries", :action => "new_form" })
  post("/create_inquiry", { :controller => "inquiries", :action => "create_row" })

  # READ
  get("/inquiries", { :controller => "inquiries", :action => "index" })
  get("/inquiries/:id_to_display", { :controller => "inquiries", :action => "show" })

  # UPDATE
  get("/inquiries/:prefill_with_id/edit", { :controller => "inquiries", :action => "edit_form" })
  post("/update_inquiry/:id_to_modify", { :controller => "inquiries", :action => "update_row" })

  # DELETE
  get("/delete_inquiry/:id_to_remove", { :controller => "inquiries", :action => "destroy_row" })

  #------------------------------

  # Routes for the Booking resource:

  # CREATE
  get("/bookings/new", { :controller => "bookings", :action => "new_form" })
  post("/create_booking", { :controller => "bookings", :action => "create_row" })

  # READ
  get("/bookings", { :controller => "bookings", :action => "index" })
  get("/bookings/:id_to_display", { :controller => "bookings", :action => "show" })

  # UPDATE
  get("/bookings/:prefill_with_id/edit", { :controller => "bookings", :action => "edit_form" })
  post("/update_booking/:id_to_modify", { :controller => "bookings", :action => "update_row" })

  # DELETE
  get("/delete_booking/:id_to_remove", { :controller => "bookings", :action => "destroy_row" })

  #------------------------------

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
