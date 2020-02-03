require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end	

    post '/gossips/new/' do
  		Gossip.new(params["gossip_author"], params["gossip_content"]).save
  		redirect '/'
	end

	get '/gossips/:id' do
		erb :show, locals: {zegoss: Gossip.find(params[:id])}
	end
		

	get '/gossips/edit/:id' do
    	erb :edit, locals: {gossip: Gossip.find(params['id'].to_i), id: params[:id]}
 	end

 	post '/gossips/edit/:id' do
    	Gossip.update(params['id'].to_i, params['author'], params['content'])
    	redirect "/gossips/#{params['id']}"
  	end
end
