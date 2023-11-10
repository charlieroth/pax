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

    get "/account/:account_id", AccountController, :index
    post "/account", AccountController, :create
    post "/account/:account_id/actions/close", AccountController, :close

    get "/poll/:poll_id", PollController, :index
    post "/poll", PollController, :create
    patch "/poll/:poll_id", PollController, :update
    post "/poll/:poll_id/actions/close", PollController, :close
    post "/poll/:poll_id/actions/schedule", PollController, :schedule
    post "/poll/:poll_id/actions/open", PollController, :open

    get "/group/:group_id", GroupController, :index
    post "/group", GroupController, :create
    patch "/group/:group_id", GroupController, :update
    post "/group/:group_id/actions/close", GroupController, :close
    post "/group/:group_id/actions/invite", GroupController, :invite
    get "/group/:group_id/invitations", GroupController, :invitations
    get "/group/:group_id/polls", GroupController, :polls

    post "/invite/:invite_id/actions/accept", InviteController, :accept
    post "/invite/:invite_id/actions/decline", InviteController, :decline
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
