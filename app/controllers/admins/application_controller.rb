class Admins::ApplicationController < ApplicationController
	private
	before_action :authenticate_admin!, only: [:index, :show, :create, :edit, :update, :new, :destroy]
	after_action :save_my_previous_url, only: [:new]

	def save_my_previous_url
	# session[:previous_url] is a Rails built-in variable to save last url.
	session[:my_previous_url] = URI(request.referer || '').path
	end
end
