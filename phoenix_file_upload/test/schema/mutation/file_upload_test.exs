defmodule PhoenixFileUpload.Schema.Mutation.FileUploadTest do
  use PhoenixFileUpload.ConnCase

  @query """
    mutation {uploadFile(file_data: "file_data_attribute_arbitraty_name")}
  """

  test "upload file", %{conn: conn} do
    upload = %Plug.Upload{
      content_type: "text/csv",
      filename: "users.csv",
      path: Path.expand("../../../../users.csv", __DIR__)
    }

    resp =
      conn
      |> post("/graphql", %{"query" => @query, "file_data_attribute_arbitraty_name" => upload})

    decode_response = response(resp, 200)
  end
end

