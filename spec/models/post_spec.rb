require 'spec_helper'

describe Post do
  #pending "add some examples to (or delete) #{__FILE__}"

	describe "Post" do

		before {
			@post = Post.new(:title => "Test title", :content => "Test content")
		}

		subject {
			@post
		}

		it "should have a title" do
			expect(@post).to respond_to :title
		end

		it "should have a content" do
			expect(@post).to respond_to :content
		end
	end
end


