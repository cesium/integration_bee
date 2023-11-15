defmodule IntegrationBeeWeb.HomeLive.Index do
  use IntegrationBeeWeb, :live_view

  alias IntegrationBee.Competition
  alias IntegrationBee.Competition.Student

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :students, Competition.list_students())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_info({IntegrationBeeWeb.StudentLive.FormComponent, {:saved, student}}, socket) do
    {:noreply, stream_insert(socket, :students, student)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    student = Competition.get_student!(id)
    {:ok, _} = Competition.delete_student(student)

    {:noreply, stream_delete(socket, :students, student)}
  end
end
