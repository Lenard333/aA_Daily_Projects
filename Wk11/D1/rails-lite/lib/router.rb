class Route
  attr_reader :pattern, :http_method, :controller_class, :action_name

  def initialize(pattern, http_method, controller_class, action_name)
    @pattern = pattern 
    @http_method = http_method # symbol for (actions)
    @controller_class = controller_class 
    @action_name = action_name
  end

  # checks if pattern matches path and method matches request method
  def matches?(req)
    req.request_method.downcase.to_sym == http_method && 
    pattern.match?(req.path)
    
  end

  # use pattern to pull out route params (save for later?)
  # instantiate controller and call controller action
  def run(req, res)
    req_path = req.path
    controller = controller_class.new(req, res, {})
    controller.invoke_action(action_name)
  end
end

class Router
  attr_reader :routes

  def initialize
    @routes = []
  end

  # simply adds a new route to the list of routes
  def add_route(pattern, method, controller_class, action_name)
    @routes << Route.new(pattern, method, controller_class, action_name)
  end

  # evaluate the proc in the context of the instance
  # for syntactic sugar :)
  def draw(&proc)
    # a = self.instance_eval(proc.call)
    self.instance_eval(&proc)
  end

  # make each of these methods that
  # when called add route
  [:get, :post, :put, :delete].each do |http_method|
    define_method(http_method) do |pattern, controller_class, action_name|
      add_route(pattern, http_method, controller_class, action_name)
    end
  end
  # ^ translate to 
  # def get(pattern, http_method, controller_class, action_name)
  #   add_route(pattern, http_method, controller_class, action_name)
  # end

  # should return the route that matches this request
  def match(req)
    
    @routes.each do |route|
      return route if route.matches?(req)
    end
    nil
  end

  # either throw 404 or call run on a matched route
  def run(req, res)
    a = match(req)
    if a
      a.run
    else
      res.status = 404 
    end
  end
end
