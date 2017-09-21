# CircularRefPhx

There can definitely be clean-up in the controller and movement of functions there into
context functions, but it works.  

Note that it also checks against existing alias records
for the individual, and if an exact match is found, the individual's :master_alias_id is set
without inserting a new alias record, and any other updates occur to the individual if they are
valid.  That logic could be abstracted to some function and then involved in the Mutli pipeline
I suppose.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
