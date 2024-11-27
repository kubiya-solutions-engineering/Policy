# Default deny all access
default allow = false

# Allow access to specific tools
allow {
    input.tool.name == "request_tool_access"
}

allow {
    input.tool.name == "describe_access_request"
}

allow {
    input.tool.name == "search_access_requests"
}

allow {
    input.tool.name == "list_active_access_requests"
}

allow {
    input.tool.name == "github_pipeline_diagnostic"
}

allow {
    input.tool.name == "cluster_health"
}

# Allow solution-engineer team to approve access
allow {
    group := input.user.groups[_]
    group == "solution-engineer"
    tool := input.tool.name
    tool == "approve_tool_access_request"
}
