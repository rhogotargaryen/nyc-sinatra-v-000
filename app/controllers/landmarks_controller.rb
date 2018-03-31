class LandmarksController < ApplicationController
    
    get '/landmarks/new' do
        erb :'/landmarks/new'
    end
    
    post '/landmarks' do
        @landmark = Landmark.create(params[:landmark])
        redirect '/landmarks'
    end
    
    get '/landmarks' do
        erb :'/landmarks/index'
    end
    
    get '/landmarks/:id' do
        @landmark = Landmark.find_by_id(params[:id])
        erb :"/landmarks/show"
    end
    
    get '/landmarks/:id/edit' do
        @landmark = Landmark.find_by_id(params[:id])
        erb :"/landmarks/edit"
    end
    
    post '/landmarks/:id' do
        @landmark = Landmark.find_by_id(params[:id])
        @landmark.name = params[:landmark][:name] if !params[:landmark][:name].empty?
        @landmark.figure = Figure.find_by_name(name: params[:figure][:name]) if !params[:figure][:name].empty?
        @landmark.year_completed = params[:landmark][:year_completed] if !params[:landmark][:year_completed].empty?
        @landmark.save
        redirect "/landmarks/#{@landmark.id}"
    end
end
