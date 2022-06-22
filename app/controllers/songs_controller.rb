class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    post '/songs' do
        s = Song.create(name: params["Name"], artist: Artist.find_or_create_by(name: params["Artist Name"]), genre_ids: params["genres"])
        flash[:message] = "Successfully created song."
        redirect "/songs/#{s.slug}"
    end

    patch '/songs/:slug' do
        Song.find_by_slug(params[:slug]).update(name: params["Name"], artist: Artist.find_or_create_by(name: params["Artist Name"]), genre_ids: params["genres"])
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{params[:slug]}"
    end

    get '/songs/new' do
        erb :"/songs/new"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end
end
