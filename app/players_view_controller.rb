class PlayersViewController < UITableViewController

	attr_accessor :players

	def viewDidLoad

		load_players
		@game ||= ""

	end

	def numberOfSectionsInTableView(tableView)
    1
  end
  
  def tableView(tableView, numberOfRowsInSection:secton)
    @players.count
  end

  def imageForRating(rating)

  	case rating
  	when 1
  		UIImage.imageNamed("1_star_rating.png")
  	when 2
  		UIImage.imageNamed("2_star_rating.png")
  	when 3
  		UIImage.imageNamed("3_star_rating.png")
  	when 4
  		UIImage.imageNamed("4_star_rating.png")
  	when 5
  		UIImage.imageNamed("5_star_rating.png")
  	end

  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)

  	cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell")
    
    player = @players[indexPath.row]
    cell.nameLabel.text = player.name
    cell.gameLabel.text = player.game
    cell.ratingImageView.image = imageForRating(player.rating)
    
    cell
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)

  	if(editingStyle == UITableViewCellEditingStyleDelete)
  		
  		@players.delete_at(indexPath.row)
  		tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)

  	end

  end

  def playerDetailsViewControllerDidCancel(controller)
  	controller.dismissViewControllerAnimated(true, completion:nil)
  end

  def playerDetailsViewControllerDidAddPlayer(controller, player)
  	@players << player

  	path = NSIndexPath.indexPathForRow(@players.count-1, inSection:0)    

		tableView.insertRowsAtIndexPaths([path], withRowAnimation:UITableViewRowAnimationAutomatic)

  	controller.dismissViewControllerAnimated(true, completion:nil)
  end

  def prepareForSegue(segue, sender:sender)
    
    if (segue.identifier == 'AddPlayer')
            
      navigationController = segue.destinationViewController
      playerDetailsViewController = navigationController.viewControllers[0]
      playerDetailsViewController.delegate = self
      
    end
  end

  protected
	def load_players

		@players ||= [
			Player.new("Bill Evans", "Tic-Tac-Toe", 4),
			Player.new("Oscar Peterson", "Spin the Bottle", 5),
			Player.new("Dave Brubeck", "Texas Hold’em Poker", 2),
			Player.new("Bob Wilsome", "Angry Bird", 3)
		]

	end

end