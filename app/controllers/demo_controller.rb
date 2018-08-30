class DemoController < ApplicationController
  layout false

  def index
    render('hello')
  end

  def hello
    render('index')
  end

  def otherhello
    redirect_to(:action => 'index')
  end

  def lynda
    redirect_to('http://lynda.com')
  end
end
