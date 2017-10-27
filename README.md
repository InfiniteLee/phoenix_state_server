# StateServer

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Running the state server:

  * Open multiple tabs and go to localhost:4000
  * View console to see state messages
  * Use window.updateState("new state goes here") to update state
  * Observe that on all instances the state will be updated
