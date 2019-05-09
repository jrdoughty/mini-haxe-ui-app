package;

import kha.input.Keyboard;
import haxe.ui.focus.FocusManager;
import haxe.ui.components.Button;
import haxe.ui.core.Screen;
import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import haxe.ui.core.MouseEvent;
import haxe.ui.components.TextField;
import haxe.ui.containers.ScrollView;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.input.KeyCode;
import kha.System;

class Main {

	
	public static var app:HaxeUIApp;
	public static var inputText:TextField;
	public static var outputText:TextField;
	public static var trimButton:Button;
	public static var vbox:ScrollView;
	public static function main() {
		System.init({title: "HaxeUI Kha", width: 1024, height: 768}, function () {
			Assets.loadEverything(function () {
				Toolkit.init();
				System.notifyOnRender(render);
				Scheduler.addTimeTask(update, 0, 1 / 60);

				app = new HaxeUIApp();
				//app.addComponent(new Button());
				app.ready(createLayout);
			});
		});
	}

	static function update(): Void {
		
	}

	static function render(framebuffer: Framebuffer): Void {
		var g = framebuffer.g2;
		g.begin(true, 0xFFFFFF);
		Screen.instance.renderTo(g);
		g.end();
	}
	
	static function createLayout()
	{
			vbox = new ScrollView();
			vbox.backgroundColor = 0xA0A0A0;
			vbox.width = 500;
			vbox.height = 140;
			
			inputText = new TextField();
			//inputText.x = 0;
			//inputText.y = 0;
			inputText.width = 360;
			inputText.height = 40;
			inputText.placeholder = '.csv to trim';
			vbox.addComponent(inputText);
			
			outputText = new TextField();
			//outputText.x = 0;
			//outputText.y = 40;
			outputText.width = 360;
			outputText.height = 40;
			outputText.placeholder = '.csv file to output';
			vbox.addComponent(outputText);
			
			trimButton = new Button();
			//trimButton.x = 360;
			trimButton.width = 40;
			//trimButton.y = 0;
			trimButton.height = 80;
			trimButton.text = 'Trim';
			trimButton.onClick = click;
			
			vbox.addComponent(trimButton);
			
			app.addComponent(vbox);
			Keyboard.get(0).notify(tab,null,null);
			app.start();
	}
	
	static function click(e:MouseEvent)
	{
		
	}
	static function tab(k:KeyCode)
	{
		if(k == KeyCode.Tab)
			FocusManager.instance.focusNext();
	}
}
