class GamePickerViewController < UITableViewController

	attr_accessor :games, :selected_index, :game

	# outlet
	attr_accessor :delegate

	def viewDidLoad
		super
		load_games
		@selected_index = @game ? @games.index(@game) : nil 
	end

	def viewDidUnload
		super
		@games = nil
	end

	def numberOfSectionsInTableView(tableView)
		1
	end

	def tableView(tableView, numberOfRowsInSection:secton)
    @games.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
  	cell = tableView.dequeueReusableCellWithIdentifier("GameCell")
    cell.textLabel.text = @games[indexPath.row].name  

    if(indexPath.row == @selected_index)  
    	cell.accessoryType = UITableViewCellAccessoryCheckmark
    else
    	cell.accessoryType = UITableViewCellAccessoryNone
    end

    cell
  end


	def tableView(tableView, didSelectRowAtIndexPath:indexPath)
		tableView.deselectRowAtIndexPath(indexPath, animated:true)

		if(@selected_index)
			path = NSIndexPath.indexPathForRow(@selected_index, inSection:0)
			cell = tableView.cellForRowAtIndexPath(path)
			cell.accessoryType = UITableViewCellAccessoryNone
		end

		@selected_index = indexPath.row
		cell = tableView.cellForRowAtIndexPath(indexPath)
		cell.accessoryType = UITableViewCellAccessoryCheckmark
		@game = @games[indexPath.row]
		self.delegate.didSelectGame(self, @game)
	end

	protected
	def load_games
		@games ||= [
			Game.new("Chess"),
			Game.new("Cricket"),
			Game.new("Football"),
			Game.new("Soccer")
		]
		@games
	end

end