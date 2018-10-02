defmodule PhoenixFileUpload.PageController do
  use PhoenixFileUpload.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
