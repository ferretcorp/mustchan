defmodule MustchanWeb.PageController do
  use MustchanWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
