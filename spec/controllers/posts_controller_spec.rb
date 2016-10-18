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
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do

    it "assign @post" do
      post = FactoryGirl.create(:post)
      get :show, { id: post.id }
      expect(assigns[:post]).to eq(post)
    end

    it "render_template" do
      post = FactoryGirl.create(:post)
      get :show, { id: post.id }
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do

    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.build(:post) }

    context "when user login" do
      before do
        sign_in user
        get :new
      end

      it "assign @post" do
        expect(assigns(:post)).to be_new_record
        expect(assigns(:post)).to be_instance_of(Post)
      end

      it "render_template" do
        expect(response).to render_template("new")
      end
    end

    context "when user not login" do
      it "redirect_to new_user_session_path" do
        get :new

        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST create" do
    let(:user) { FactoryGirl.create(:user) }

    context "when course doesn't have a title" do
      before { sign_in_user }

      it "doesn't create a record" do
        expect{ post :create, post: { :description => "bar" }}.to change{Post.count}.by(0)
      end

      it "render new_template"
        post :create, post: { :description => "bar" }

        expect(response).to render_template("new")
      end
    end

    context "when post have a title" do
      befoer {sign_in_user}

      it "create a new post record" do
        post = FactoryGirl.build(:post)

        expect{ post :create, post: FactoryGirl.attributes_for(:post)}.to change{ Post.count}.by(1)
      end

      it "redirect to posts_path" do
        post = FactoryGirl.build(:post)

        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to posts_path
      end
    end
  end

end
