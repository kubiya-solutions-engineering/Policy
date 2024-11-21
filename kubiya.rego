package kubiya.tool_manager

# Default deny all access
default allow = false

# Always allow access to request_tool_access
allow {
    tool := input.tool.name
    tool == "request_tool_access"
}

# Always allow access to request_tool_access
allow {
    tool := input.tool.name
    tool == "describe_access_request"
}

# Always allow access to request_tool_access
allow {
    tool := input.tool.name
    tool == "search_access_requests"
}

# Always allow access to request_tool_access
allow {
    tool := input.tool.name
    tool == "list_active_access_requests"
}

# Always allow access to request_tool_access
allow {
    tool := input.tool.name
    tool == "jit_session_grant_view_access_to_march17test2"
}

# Always allow access to request_tool_access
allow {
    tool := input.tool.name
    tool == "jit_session_grant_view_access_to_kubiyamichaelg"
}

# Always allow access to request_tool_access
allow {
    tool := input.tool.name
    tool == "jit_session_grant_veranatest_access_to_kubiyamichaelg"
}

# Allow solution-engineer team access to run approve tool
allow {
    group := input.user.groups[_]
    group == "solution-engineer"
    tool := input.tool.name
    tool == "approve_tool_access_request"
}
