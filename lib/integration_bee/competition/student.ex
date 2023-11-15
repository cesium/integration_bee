defmodule IntegrationBee.Competition.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :course, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:name, :course])
    |> validate_required([:name, :course])
  end
end
