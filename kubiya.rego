package kubiya.tool_manager

# Default deny all access
default allow = false

# Allow solution-engineer team access to all tools except cluster_health
allow {
    group := input.user.groups[_]
    group == "solution-engineer"
    tool := input.tool.name
    tool != "jit_session_grant_view_access_to_march17test2"
}

# Allow kubiyamg@gmail.com access to all tools except cluster_health
allow {
    tool := input.tool.name
    input.user.email == "kubiyamg@gmail.com"
}

# Allow Administrators access to all tools except cluster_health
allow {
    group := input.user.groups[_]
    group == "Administrators"
    tool := input.tool.name
    tool != "jit_session_grant_view_access_to_march17test2"
}

# Always allow access to request_tool_access
allow {
    input.tool.name == "request_tool_access"
}

# Helper function to check if tool is restricted
is_restricted(tool) {
    restricted_tools := {"cluster_health"}
    restricted_tools[tool]
}
