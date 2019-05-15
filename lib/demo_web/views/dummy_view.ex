defmodule DemoWeb.DummyView do
  use DemoWeb, :view

  def render("greeting.json", %{subject: subject}) do
    %{
      greeting: "Hello #{subject}!"
    }
  end
end
