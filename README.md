# FitAura

### API

**POST /api/v1/users/ with {user: {name: "Name", email: "Email", password: "Password", password_confirmation: "Password" } }**

Returns: {id: user.id, email: user.email, user_token: user.authenication_token }

Creates user with specified name, email and password. Returns auth token or error if user creation has failed.

**GET /api/v1/users/#{id} with { password: "Password" }**

Returns: { email: user.email, user_token: user.authenication_token }

Retrieves user auth token. Returns auth token and email, or error if user authenication has failed.

#### All other API commands take user_token and email for authenication, which can be either send in the header or in the request.

**GET /api/v1/trainers/ with { user_email: Email, user_token: Token }**

Returns: { trainers: { } }

Retrieves trainers. 
