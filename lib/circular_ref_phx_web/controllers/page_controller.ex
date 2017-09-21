defmodule CircularRefPhxWeb.PageController do
  use CircularRefPhxWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
