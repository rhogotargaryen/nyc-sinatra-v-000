class FiguresController < ApplicationController
    
    get '/figures' do
        erb :'/figures/index'
    end
    
    get '/figures/new' do
        erb :'/figures/new'
    end
    
    post '/figures' do
        @figure = Figure.create(params[:figure])
        if !params[:title][:name].empty?
            params[:title].each do |x, y|
                @figure.titles << Title.find_or_create_by(name: y)
            end
        end
        @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
        @figure.save
        redirect '/figures'
    end
    
    get '/figures/:id' do
        @figure = Figure.find_by_id(params[:id])
        erb :'/figures/show'
    end
    
    post '/figures/:id' do
        @figure = Figure.find_by_id(params[:id])
        @figure.name = params[:figure][:name] if !params[:figure][:name].empty?
        @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
        @figure.save
        erb :"/figures/show"
    end
        
    
    get '/figures/:id/edit' do
        @figure = Figure.find_by_id(params[:id])
        erb :'/figures/edit'
    end
end
