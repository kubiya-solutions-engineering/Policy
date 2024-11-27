# Default deny all access
default allow = false

# Tools that are always accessible
always_allowed_tools := {
    "request_tool_access",
    "describe_access_request",
    "search_access_requests",
    "list_active_access_requests",
    "github_pipeline_diagnostic",
    "cluster_health"
}

# Allow access to always accessible tools
allow {
    input.tool.name in always_allowed_tools
}

# Allow solution-engineer team to approve access
allow {
    "solution-engineer" in input.user.groups
    input.tool.name == "approve_tool_access_request"
}
