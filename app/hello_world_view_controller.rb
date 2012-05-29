class HelloWorldViewController < UIViewController


	def changeGreeting
		unless(self.textField.length == 0)
			self.label.text = "Hello #{self.textField.text}"
		end
	end
	
	def textFieldShouldReturn(theTextField)
    theTextField.resignFirstResponder
    true
  end
end