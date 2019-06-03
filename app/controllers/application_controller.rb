
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    @article = Article.last
    erb :new
  end

  post '/articles/:id' do
    @article = Article.create(params)
    #binding.pry
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by id: params[:id]
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by id: params[:id]
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by id: params[:id]
    @article.update(title: params[:title], content: params[:content])
    erb :show
  end

  delete '/articles/:id/delete' do
    article = Article.find_by id: params[:id]
    article.destroy
  end
end
