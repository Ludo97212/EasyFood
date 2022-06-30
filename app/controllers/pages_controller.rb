class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def contacts
  end

  def mentions
  end

  def infos
  end
end
