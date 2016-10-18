require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET index" do

    it "assigns @posts and render template" do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:post)
      get :index
      expect(assigns[:posts]).to eq([post1,post2])
    end

    it "render_template" do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:post)
      get:index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do

    it "assign @post" do
      post = FactoryGirl.create(:post)
      get :show, params: { id: post.id }
      expect(assigns[:post]).to eq(post)
    end

    it "render_template" do
      post = FactoryGirl.create(:post)
      get :show, params: { id: post.id }
      expect(response).to render_template("show")
    end
  end

  # describe "GET new" do

  #   it "assign @post" do
  #     post = FactoryGirl.build(:post)
  #     get :new
  #     expect(assigns(:post)).to be_new_record
  #     expect(assigns(:post)).to be_instance_of(Post)
  #   end

  #   it "render_template" do
  #     post = FactoryGirl.build(:post)
  #     get :new
  #     expect(response).to render_template("new")
  #   end

  # end
end
