class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # add routes
  get '/bakeries' do
    Bakery.all.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id].to_i)
    bakery.to_json include: :baked_goods
  end

  get '/baked_goods/by_price' do
    bgs = BakedGood.all.sort{ |a,b| a.price <=> b.price }.reverse
    bgs.to_json
  end

  get '/baked_goods/most_expensive' do
    bgs = BakedGood.all.sort{ |a,b| a.price <=> b.price }.reverse
    bgs.first.to_json
  end

end
