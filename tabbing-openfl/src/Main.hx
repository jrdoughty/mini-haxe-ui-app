package;

import haxe.ui.core.Screen;
import openfl.display.Sprite;
import haxe.ui.HaxeUIApp;
import haxe.ui.components.Button;
import haxe.ui.containers.ScrollView;
import haxe.ui.core.Component;
import haxe.ui.components.TextField;
import haxe.ui.events.MouseEvent;
/**
 * ...
 * @author John Doughty
 */
class Main extends Sprite 
{
	var app:HaxeUIApp;
	public static var vbox:ScrollView;
	public static var inputText:TextField;
	public static var outputText:TextField;
	public static var trimButton:Button;
	public function new() 
	{
		super();
        app = new HaxeUIApp();
        app.ready(createLayout);
		
		
	}
	
	function createLayout()
	{
		
			vbox = new ScrollView();
			vbox.backgroundColor = 0xA0A0A0;
			vbox.width = 500;
			vbox.height = 340;
			
			inputText = new TextField();
			inputText.width = 360;
			inputText.height = 40;
			inputText.placeholder = '.csv to trim';
			vbox.addComponent(inputText);
			
			outputText = new TextField();
			outputText.width = 360;
			outputText.height = 40;
			outputText.placeholder = '.csv file to output';
			vbox.addComponent(outputText);
			
			trimButton = new Button();
			trimButton.width = 40;
			trimButton.height = 80;
			trimButton.text = 'Trim';
			
			vbox.addComponent(trimButton);
			
			app.addComponent(vbox);
			app.start();		
	}
}
