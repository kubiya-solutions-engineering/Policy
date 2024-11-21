package kubiya.tool_manager

# Default deny all access
default allow = false

# Always allow access to request_tool_access
allow {
    input.tool.name == "request_tool_access"
}
