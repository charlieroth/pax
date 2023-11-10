defmodule PaxWeb.Router do
  use PaxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PaxWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PaxWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/api", PaxWeb do
    pipe_through :api

    get "/account/:account_id", AccountsController, :index
    post "/account", AccountsController, :create
    post "/account/:account_id/actions/close", AccountsController, :close

    get "/group/:group_id", GroupsController, :index
    post "/group", GroupsController, :create
    patch "/group/:group_id", GroupsController, :update
    get "/group/:group_id/invitations", GroupsController, :invitations
    get "/group/:group_id/polls", GroupsController, :polls
    post "/group/:group_id/actions/close", GroupsController, :close
    post "/group/:group_id/actions/invite", GroupsController, :invite

    get "/invite/:invite_id", InvitesController, :index
    post "/invite/:invite_id/actions/accept", InvitesController, :accept
    post "/invite/:invite_id/actions/decline", InvitesController, :decline

    get "/poll/:poll_id", PollsController, :index
    post "/poll", PollsController, :create
    patch "/poll/:poll_id", PollsController, :update
    post "/poll/:poll_id/actions/close", PollsController, :close
    post "/poll/:poll_id/actions/schedule", PollsController, :schedule
    post "/poll/:poll_id/actions/open", PollsController, :open
  end

  if Application.compile_env(:pax, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PaxWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
