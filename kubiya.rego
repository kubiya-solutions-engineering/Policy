package kubiya.tool_manager

# Default deny all access
default allow = true

# Allow solution-engineer team access to all tools except cluster_health
allow {
    group := input.user.groups[_]
    group == "solution-engineer"
    tool := input.tool.name
}

# Allow kubiyamg@gmail.com access to all tools except cluster_health
allow {
    tool := input.tool.name
    input.user.email == "kubiyamg@gmail.com"
}

# Always allow access to request_tool_access
allow {
    input.tool.name == "request_tool_access"
}
