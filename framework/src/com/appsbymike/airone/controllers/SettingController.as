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
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.filesystem.File;
	import com.appsbymike.airone.Ao;

	/**
	 * Settings controller.
	 */
	public class SettingController
	{
		private var _connection:SQLConnection;

		public function SettingController()
		{
			var database:File = File.applicationStorageDirectory.resolvePath( Ao.databaseName );
			// Set the connection
			_connection = new SQLConnection();
			_connection.open( database, SQLMode.CREATE )
			_connection.compact();
		
			var tableQuery:SQLStatement = new SQLStatement();
			tableQuery.sqlConnection = _connection;
			tableQuery.text =
				"CREATE TABLE IF NOT EXISTS main.settings (" +
				" name TEXT PRIMARY KEY, " +
				" value TEXT" +
				");";
			tableQuery.execute();
		}

		/**
		 * Load a setting 
		 * 
		 * @param name name of setting you want to retrieve value of.
		 * @return A string containing the value of the setting.
		 */
		public function fetch( name:String ):String
		{
			var fetchQuery:SQLStatement = new SQLStatement();
			fetchQuery.sqlConnection = _connection;
			fetchQuery.text = "SELECT * FROM main.settings WHERE name = :name";
			fetchQuery.parameters[':name'] = name;
			fetchQuery.execute();

			var result:SQLResult = fetchQuery.getResult();
			if ( result != null && result.data != null && result.data.length > 0 ) {
				return result.data[0].value;
			}
			return null;
		}

		/**
		 * Set a setting
		 * 
		 * @param name Name of the setting you want to store.
		 * @param value Value of the setting you want to store.
		 */
		public function store( name:String, value:String ):void
		{
			var storeQuery:SQLStatement = new SQLStatement();
			storeQuery.sqlConnection = _connection;
			storeQuery.text = "REPLACE INTO main.settings (name, value) VALUES (:name, :value)";
			storeQuery.parameters[':name'] = name;
			storeQuery.parameters[':value'] = value;
			storeQuery.execute();
		}

		/**
		 * Remove a setting
		 * 
		 * @param name Name of the setting you want to remove.
		 */
		public function remove( name:String ):void
		{
			var removeQuery:SQLStatement = new SQLStatement();
			removeQuery.sqlConnection = _connection;
			removeQuery.text = "DELETE FROM main.settings WHERE name = :name";
			removeQuery.parameters[':name'] = name;
			removeQuery.execute();
		}
	}
}