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
package com.appsbymike.airone
{
	import com.appsbymike.airone.controllers.NetworkMonitorController;
	import com.appsbymike.airone.controllers.SettingController;
	import com.appsbymike.airone.controllers.UpdateController;
	import com.appsbymike.airone.controllers.WindowController;
	
	[Bindable]
	public class Ao
	{
		/**
		 * Update file path
		 * @default "app:/config/update.xml"
		 */
		public static var updateConfigFile:String = 'app:/config/update.xml';

		/**
		 * Name of database to connect to
		 * @default "aodb.db"
		 */
		public static var databaseName:String = 'aodb.db';

		/**
		 * URL to monitor for connection. Must be a domain.
		 * @example <code>monitorDomain = 'google.com';</code>
		 */
		public static var monitorDomain:String;
		/**
		 * Port to monitor for connection.
		 * @default 80
		 */
		public static var monitorPort:uint = 80;

		/** Provides methods to manipulate the window. */
		public static var window:WindowController;

		/** Provides access to setting and retrieving settings. */
		public static var settings:SettingController;

		/**
		 * Provides access to an update manager.
		 * 
		 * <p>More info: <a href="http://help.adobe.com/en_US/AIR/1.5/devappsflex/WS5b3ccc516d4fbf351e63e3d118666ade46-7ff2.html">
		 * http://help.adobe.com/en_US/AIR/1.5/devappsflex/WS5b3ccc516d4fbf351e63e3d118666ade46-7ff2.html
		 * </a></p>
		 */
		public static var update:UpdateController;

		/** Provides access to a network monitor. */
		public static var networkMonitor:NetworkMonitorController;

		/**
		 * Initializes controllers.
		 */
		public static function init():void
		{
			window = new WindowController();
			settings = new SettingController();
			update = new UpdateController();
			networkMonitor = new NetworkMonitorController();
		}

		public function Ao( locker:Lock ) {}
	}
}
class Lock {}