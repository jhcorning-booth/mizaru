class ProviderController < ApplicationController

  def index
    matching_requests = Request.all

    @list_of_requests = matching_requests.order({ :created_at => :desc })

    render({ :template => "view_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_requests = Request.where({ :id => the_id })

    @the_request = matching_requests.at(0)

    render({ :template => "view_requests/accept.html.erb" })
  end

  def update
    the_id = params.fetch("path_id")
    the_request = Request.where({ :id => the_id }).at(0)

    the_request.request_status = "Accepted"
    #the_request.requestor_id = params.fetch("query_requestor_id")
    the_request.provider_id = params.fetch("query_provider_id")

    if the_request.valid?
      the_request.save
      redirect_to("/view_requests/#{the_request.id}", { :notice => "Request updated successfully."} )
    else
      redirect_to("/view_requests/#{the_request.id}", { :alert => the_request.errors.full_messages.to_sentence })
    end
  end

end
