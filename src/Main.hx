package;

import haxe.Json;

import haxe.ui.components.TextField;
import haxe.ui.containers.ScrollView;
import haxe.ui.core.MouseEvent;
import openfl.display.Sprite;
import haxe.ui.HaxeUIApp;
import haxe.ui.components.Button;

//import sys.io.File;

/**
 * ...
 * @author John Doughty
 */
 
 typedef SlotData = {
	 var id : Int;
	 var date : String;
	 var spins : Int;
	 var total_bet : Int;
	 var net : Int;
 }
 
class Main extends Sprite 
{
	var app:HaxeUIApp;
	var inputText:TextField;
	var outputText:TextField;
	var trimButton:Button;
	var vbox:ScrollView;
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
			vbox.width = 400;
			vbox.height = 80;
			
			inputText = new TextField();
			inputText.x = 0;
			inputText.y = 0;
			inputText.width = 360;
			inputText.height = 40;
			inputText.placeholder = '.csv to trim';
			vbox.addChild(inputText);
			
			outputText = new TextField();
			outputText.x = 0;
			outputText.y = 40;
			outputText.width = 360;
			outputText.height = 40;
			outputText.placeholder = '.csv file to output';
			vbox.addChild(outputText);
			
			trimButton = new Button();
			trimButton.x = 360;
			trimButton.width = 40;
			trimButton.y = 0;
			trimButton.height = 80;
			trimButton.text = 'Trim';
			trimButton.onClick = click;
			
			vbox.addChild(trimButton);
			
			app.addComponent(vbox);
			app.start();
	}
	
	function click(e:MouseEvent)
	{
		
	}
}
