class PlayerDetailsViewController < UITableViewController

	attr_accessor :game

	# outlet
	attr_accessor :delegate, :nameTextField, :detailLabel

	def viewDidLoad
		super

		self.detailLabel.text = game
	end

	def done(sender)
		player = Player.new(self.nameTextField.text, @game, 1)

		self.delegate.playerDetailsViewControllerDidAddPlayer(self, player)
	end

	def cancel(sender)
		self.delegate.playerDetailsViewControllerDidCancel(self)
	end

	def prepareForSegue(segue, sender:sender)
		NSLog("segue.identifier = #{segue.identifier}")
		if(segue.identifier == "PickGame")
			gamePickViewController = segue.destinationViewController
			gamePickViewController.delegate = self
			gamePickViewController.game = @game
		end
	end

	def didSelectGame(controller, game)
		@game = game

		self.detailLabel.text = game
		self.navigationController.popViewControllerAnimated(true)
	end

end