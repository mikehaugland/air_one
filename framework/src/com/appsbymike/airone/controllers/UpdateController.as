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
	import air.update.ApplicationUpdaterUI;
	import air.update.events.UpdateEvent;

	import com.appsbymike.airone.Ao;
	import com.appsbymike.airone.events.UpdateErrorEvent;

	import flash.events.ErrorEvent;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;

	public class UpdateController extends EventDispatcher
	{
		private var _updater:ApplicationUpdaterUI = new ApplicationUpdaterUI();

		/**
		 * Check for an update.
		 */
		public function checkForUpdate():void
		{
			_updater.checkNow();
		}

		/**
		 * Event handler for errors. Dispatches updateErrorEvent.
		 */
		private function updateError( e:ErrorEvent ):void
		{
			dispatchEvent( new UpdateErrorEvent( e.text ) );
		}

		/**
		 * Checks for an update request is initialized.
		 */
		private function updateInitialized( e:UpdateEvent ):void
		{
			_updater.checkNow();
		}

		public function UpdateController() {
			super();
			_updater.configurationFile = new File( Ao.updateConfigFile );
			_updater.addEventListener( UpdateEvent.INITIALIZED, updateInitialized );
			_updater.addEventListener( ErrorEvent.ERROR, updateError );
			_updater.initialize();
		}
	}
}