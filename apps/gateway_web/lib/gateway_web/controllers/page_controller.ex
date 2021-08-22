defmodule GatewayWeb.PageController do
  use GatewayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
