class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # storyboard = UIStoryboard.storyboardWithName("MainStoryboard", bundle: NSBundle.mainBundle)
    # view_controller = storyboard.instantiateViewControllerWithIdentifier("Main")

    # @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    # @window.rootViewController = view_controller
    # @window.makeKeyAndVisible

    # true

  	# @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

   #  storyboard = UIStoryboard.storyboardWithName("HelloWorld", bundle:nil)
   #  rootVC = storyboard.instantiateViewControllerWithIdentifier("Main")

   #  @window.rootViewController = rootVC
   #  @window.makeKeyAndVisible


    # alert = UIAlertView.new
    # alert.message = "Hello World!"
    # alert.show
    true
  end

  def window
    @window
  end
  
  def setWindow(new_window)
    @window = new_window
  end
end
