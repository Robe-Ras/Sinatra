require 'sinatra'
require 'pry'

require_relative 'gossip'


class ApplicationController < Sinatra::Base
  # Chemin pour la page d'accueil
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  # Chemin pour la création d'un nouveau gossip
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new' do
    # Je récupère les données du formulaire avec params
    author = params["gossip_author"]
    content = params["gossip_content"]
  
    # Je crée une instance de Gossip
    gossip = Gossip.new(author, content)
  
    # J'enregistre dans le fichier CSV
    gossip.save

    # Redirection vers la page d'accueil après avoir rempli le formulaire
    redirect '/'
  end
end
