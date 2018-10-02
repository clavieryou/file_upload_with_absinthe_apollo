defmodule PhoenixFileUpload.Schema do
  use Absinthe.Schema

  # Important: Needed to use the `:upload` type
  import_types Absinthe.Plug.Types

  query do  # Needed even the query is empty

  end

  mutation do
    field :upload_file, :string do
      arg :file_data, non_null(:upload)

      resolve fn args, _ ->
        args.file_data # this is a `%Plug.Upload{}` struct.

        {:ok, "success"}
      end
    end
  end
end
