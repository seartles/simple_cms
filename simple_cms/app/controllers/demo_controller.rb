class DemoController < ApplicationController
  layout false

  def index
  	render(:template => 'demo/index')
  end

  def hello
  	#render(:template => 'demo/hello')
  	@array = [1,2,3,4,5]
  end

  def other_hello
  	redirect_to(:controller=> 'demo', :action=> 'index')
  end

  def lynda
  	redirect_to('http://lynda.com')
  end

end
