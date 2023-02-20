defmodule FactoryWeb.PageController do
  use FactoryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
