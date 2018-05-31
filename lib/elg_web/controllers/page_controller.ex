defmodule ElgWeb.PageController do
  use ElgWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
