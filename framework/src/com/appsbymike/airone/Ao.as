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
	import com.appsbymike.airone.controllers.SettingController;
	import com.appsbymike.airone.controllers.WindowController;
	
	[Bindable]
	public class Ao
	{
		/** URL to update.xml file */
		public static var updateUrl:String;

		/** Name of database to connect to */
		public static var databaseName:String = 'aodb.db';

		/** Provides methods to manipulate the window. */
		public static var window:WindowController = new WindowController();

		/** Provides access to setting and retrieving settings. */
		public static var settings:SettingController = new SettingController();

		public function Ao( locker:Lock ) {}
	}
}
class Lock {}