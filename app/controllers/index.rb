get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  # route to a view that has a form for creating
  # an event
end

post '/events/create' do
  # this is the route triggered by submitting
  # a form on the /events/new view
  # this is where the validations are checked
  # and where the errors.full_messages
  # handling needs to go before redirecting 
  # or rendering some other view of the 
  # created event (redirect to id/show...),
  # which itself is wehre the errors will be 
  # displayed if there are any
end
