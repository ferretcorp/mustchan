# Mustchan

The Mustelid Channel MUST exist.

Gentlemen,
The internet is broken. It is OUR job to fix it. We shall do so against all odds, one piece of neutral infrastructure at a time.

The purpose of this project is to give users a place to track and write about their favorite media, particularly video games. 

Besides the bare minimum logging and review functionality, there's also the need for an archival effort. What passes for "media literacy" online is a collective hallucination, so MustChan will equip its users to write assorted editorials and Set The Record Straight on whatever they've taken particular interest in. Augmented information regarding production history, archeologically uncovered story drafts, lost developer commentaries, budgeting mysteries, production times, etc! The WHO and the HOW behind how a piece of art come into being--previously scattered all over the internet--come to light.

MustChan is a website for the art of anyone at all to be appreciated and catalogued by those who write coherently about them.

May the videogame science be restored, Amen.

# Technical Notes
WHY Phoenix LiveView, Elixir, and the BEAM/OTP stack? 

Several reasons. Namely that I, The Developer, personally like Functional Programming, Fault Tolerant Systems, and the original vision behind Erlang. In a world where things barely work most the time, Erlang and its descendants power the infrastructure of Ericsson telecommunications, WhatsApp, and Discord, to name a few. But that's enough from me, you can feel free to watch [Joe Armstrong explain his technology himself](https://www.youtube.com/watch?v=cNICGEwmXLU). 

The tl;dr is that Phoenix largely Just Works(tm). Elixir is a pleasant language to write in, and the BEAM VM underneath allows it to scale to as many CPU cores and extra servers you throw at it. Problem solved, forever. It's also particularly good at keeping persistent sessions going: very important for never losing drafts of posts. Key design principle: The user should be able to yank the power cord out of their PC and come back to their writing like nothing happened.

## Running Things
* First off, [Install Elixir](https://elixir-lang.org/install.html).
* Get [PostgreSQL](https://www.postgresql.org/download/).
* Then install Hex, Elixir's package manager. `mix local.hex`
* Now install Phoenix itself. `mix archive.install hex phx_new`

Set up the Database on your local machine:
import Config

# Configure your database
What I did on Arch(btw):
* Install. `sudo pacman -S postgresql`
* First time init. `sudo -u postgres initdb -D /var/lib/postgres/data`
* Get it going on boot, using systemd. If you're using another init system you'll know what to do.
* ``sudo systemctl start postgresql``
* ``sudo systemctl enable postgresql``
* Do whatever it is you do to get a PostgreSQL db going. ``createuser -s postgres``
* Development database name. ``createdb mustchan_dev``

Database is one of those weird things where there's a million different ways of doing it. This WILL be updated for security.
The config is in `config/dev.exs`. We got this, You got this, We got this together. That sorta thing.

To start the Phoenix server:
* Run `mix setup` to install and setup dependencies
* Get your database linked up using `mix ecto.setup`
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Yeah yeah. We'll get around to a Docker Container or, better yet, a Nix flake. Soon. Run it locally for now.

Ready for prod? [Check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### Web framework info

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
