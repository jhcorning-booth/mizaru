Rails.application.routes.draw do

  get("/", { :controller => "requests", :action => "index" })

  # Routes for the Request resource:

  # CREATE
  post("/insert_request", { :controller => "requests", :action => "create" })
          
  # READ
  get("/requests", { :controller => "requests", :action => "index" })
  
  get("/requests/:path_id", { :controller => "requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_request/:path_id", { :controller => "requests", :action => "update" })
  
  # DELETE
  get("/delete_request/:path_id", { :controller => "requests", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  # get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
