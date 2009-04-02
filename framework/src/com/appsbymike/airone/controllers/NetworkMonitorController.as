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
	import air.net.SocketMonitor;
	
	import com.appsbymike.airone.Ao;
	import com.appsbymike.airone.events.NetworkStatusChangeEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;

	[Bindable]
	/**
	 * Network monitoring controller allows you to recieve notifications
	 * when a connection to a specified URL changes.
	 */
	public class NetworkMonitorController extends EventDispatcher
	{
		/**
		 * @private
		 */
		private var socketMonitor:SocketMonitor;
		/**
		 * Online status of the specified url.
		 * 
		 * @return <code>true</code> if online; <code>false</code> if offline.
		 */
		public static var online:Boolean = false;

		/**
		 * Start the socket monitor
		 */
		public function start():void {
			if ( Ao.monitorDomain != null ) {
				socketMonitor = new SocketMonitor( Ao.monitorDomain, Ao.monitorPort );
				socketMonitor.pollInterval = 2000;
				socketMonitor.addEventListener( StatusEvent.STATUS, networkHandler );
				socketMonitor.start();
			} else {
				throw new Error( "No URL specified to monitor. Make sure Ao.monitorUrl is set." );
			}
		}
		/**
		 * Stop the socket monitor
		 */
		public function stop():void {
			socketMonitor.stop();
		}

		/**
		 * Event handler for network status changes.
		 */
		private function networkHandler( e:StatusEvent ):void
		{
			if ( socketMonitor.available ) {
				online = true;
				dispatchEvent( new NetworkStatusChangeEvent( NetworkStatusChangeEvent.NETWORK_STATUS_CHANGE, true ) );
			} else {
				online = false;
				dispatchEvent( new NetworkStatusChangeEvent( NetworkStatusChangeEvent.NETWORK_STATUS_CHANGE, false ) );
			}
		}

		public function NetworkMonitorController()
		{
			super();
		}
	}
}