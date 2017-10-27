defmodule StateServerWeb.PageController do
  use StateServerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
