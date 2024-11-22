package kubiya.tool_manager

# Default: Deny all access
default allow = false

# Allow access to specific tools by name
allow {
    input.tool.name == "request_tool_access" 
    or input.tool.name == "describe_access_request"
    or input.tool.name == "search_access_requests"
    or input.tool.name == "list_active_access_requests"
    or input.tool.name == "github_pipeline_diagnostic"
}

# Allow "solution-engineer" group to run the "approve_tool_access_request" tool
allow {
    input.tool.name == "approve_tool_access_request"
    "solution-engineer" in input.user.groups
}
