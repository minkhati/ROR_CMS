class DemoController < ApplicationController
  layout 'application' # By default use application layout file 

  def index
    
  end

  def hello
    
  end

  def otherhello
    redirect_to(:action => 'index')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

  def escape_output

  end
end
