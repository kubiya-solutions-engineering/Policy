package kubiya.tool_manager

# Default deny all access
default allow = false

allow {
    group := input.user.groups[_]
    group == "solution-engineer"
    tool := input.tool.name
    tool == "approve_tool_access_request"
}

# Always allow access to request_tool_access
allow {
    input.tool.name == "request_tool_access"
}
