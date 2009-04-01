/*******************************************************************************
 * Copyright (c) 2009 Mike Haugland and Contributors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Redistributions of files must retain the above copyright notice.
 ******************************************************************************/
package com.appsbymike.airone.controllers
{
	import com.appsbymike.airone.Ao;
	
	import flash.desktop.NativeApplication;
	import flash.display.NativeWindow;
	
	/** 
	 * Provides methods to manipulate the window.
	 */
	public class WindowController
	{
		/**
		 * Default X position (distance from left of screen)
		 * @default 50
		 */
		private static var defaultX:int = 50;
		/**
		 * Default Y position (distance from top of screen)
		 * @default 50
		 */
		private static var defaultY:int = 50;
		/**
		 * Default application height
		 * @default 680
		 */
		private static var defaultHeight:uint = 680;
		/**
		 * Default application width
		 * @default 980
		 */
		private static var defaultWidth:uint = 980;

		public function WindowController() {}

		/**
		 * Sets the position and dimensions of the window based on user
		 * setting or the default settings.
		 */
		public function loadWindowSettingsOrDefault():void {
			var window:NativeWindow = NativeApplication.nativeApplication.openedWindows[0];
			window.y = Ao.settings.fetch( 'userY' ) != null ? int(Ao.settings.fetch( 'userY' )) : defaultY;
			window.x = Ao.settings.fetch( 'userX' ) != null ? int(Ao.settings.fetch( 'userX' )) : defaultX;
			window.width = Ao.settings.fetch( 'userWidth' ) != null ? int(Ao.settings.fetch( 'userWidth' )) : defaultWidth;
			window.height = Ao.settings.fetch( 'userHeight' ) != null ? int(Ao.settings.fetch( 'userHeight' )) : defaultHeight;
		}

		/**
		 * Clears the users settings for window size and dimensions.
		 * 
		 * @param forceUpdate runs loadWindowSettingOrDefault after clearing (default is <code>true</code>)
		 */
		public function clearSavedSettings( forceUpdate:Boolean=true ):void {
			Ao.settings.remove( 'userY' );
			Ao.settings.remove( 'userX' );
			Ao.settings.remove( 'userWidth' );
			Ao.settings.remove( 'userHeight' );

			if ( forceUpdate ) {
				this.loadWindowSettingsOrDefault();
			}
		}

		/**
		 * Determines window position and dimensions
		 * 
		 * @return An object containing the position and dimensions of the active window.
		 */
		public function get position():Object
		{
			var window:NativeWindow = NativeApplication.nativeApplication.openedWindows[0];
			var position:Object = [];
			position.height = window.height;
			position.width = window.width;
			position.x = window.x;
			position.y = window.y;

			return position;
		}

		/**
		 * Sets the window to fill screen (maximize).
		 */
		public function sizeToFit():void {
			var window:NativeWindow = NativeApplication.nativeApplication.openedWindows[0];
			window.maximize();
		}

	}
}