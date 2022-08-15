class RequestsController < ApplicationController
  def index
    matching_requests = Request.all

    @list_of_requests = matching_requests.order({ :created_at => :desc })

    render({ :template => "requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_requests = Request.where({ :id => the_id })

    @the_request = matching_requests.at(0)

    render({ :template => "requests/show.html.erb" })
  end

  def create
    the_request = Request.new
    the_request.request_date = params.fetch("query_request_date")
    the_request.request_start_time = params.fetch("query_request_start_time")
    the_request.request_end_time = params.fetch("query_request_end_time")
    the_request.request_location = params.fetch("query_request_location")
    the_request.request_street_address = params.fetch("query_request_street_address")
    the_request.request_city = params.fetch("query_request_city")
    the_request.request_state = params.fetch("query_request_state")
    the_request.request_country = params.fetch("query_request_country")
    the_request.request_postal_code = params.fetch("query_request_postal_code")
    the_request.request_parking_location = params.fetch("query_request_parking_location")
    the_request.request_meeting_location = params.fetch("query_request_meeting_location")
    the_request.request_pet = params.fetch("query_request_pet", false)
    the_request.request_gender_preference = params.fetch("query_request_gender_preference")
    the_request.request_comments = params.fetch("query_request_comments")
    the_request.request_amount = (20*(the_request.request_end_time.to_i/3600 - the_request.request_start_time.to_i/3600)) #params.fetch("query_request_amount")
    the_request.request_status = "Pending" #params.fetch("query_request_status")""
    the_request.requestor_id = session.fetch(:user_id)
    #the_request.provider_id = params.fetch("query_provider_id")

    if the_request.valid?
      the_request.save
      redirect_to("/requests", { :notice => "Request created successfully." })
    else
      redirect_to("/requests", { :alert => the_request.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_request = Request.where({ :id => the_id }).at(0)

    the_request.request_date = params.fetch("query_request_date")
    the_request.request_start_time = params.fetch("query_request_start_time")
    the_request.request_end_time = params.fetch("query_request_end_time")
    the_request.request_location = params.fetch("query_request_location")
    the_request.request_street_address = params.fetch("query_request_street_address")
    the_request.request_city = params.fetch("query_request_city")
    the_request.request_state = params.fetch("query_request_state")
    the_request.request_country = params.fetch("query_request_country")
    the_request.request_postal_code = params.fetch("query_request_postal_code")
    the_request.request_parking_location = params.fetch("query_request_parking_location")
    the_request.request_meeting_location = params.fetch("query_request_meeting_location")
    the_request.request_pet = params.fetch("query_request_pet", false)
    the_request.request_gender_preference = params.fetch("query_request_gender_preference")
    the_request.request_comments = params.fetch("query_request_comments")
    the_request.request_amount = params.fetch("query_request_amount")
    the_request.request_status = params.fetch("query_request_status")
    the_request.requestor_id = params.fetch("query_requestor_id")
    the_request.provider_id = params.fetch("query_provider_id")

    if the_request.valid?
      the_request.save
      redirect_to("/requests/#{the_request.id}", { :notice => "Request updated successfully."} )
    else
      redirect_to("/requests/#{the_request.id}", { :alert => the_request.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_request = Request.where({ :id => the_id }).at(0)

    the_request.destroy

    redirect_to("/requests", { :notice => "Request deleted successfully."} )
  end
end
