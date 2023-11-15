defmodule IntegrationBee.CompetitionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IntegrationBee.Competition` context.
  """

  @doc """
  Generate a student.
  """
  def student_fixture(attrs \\ %{}) do
    {:ok, student} =
      attrs
      |> Enum.into(%{
        course: "some course",
        name: "some name"
      })
      |> IntegrationBee.Competition.create_student()

    student
  end
end
