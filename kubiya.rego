package kubiya.tool_manager

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
    tool := input.tool.name
    tool in always_allowed_tools
}

# Allow solution-engineer team specific tool access
allow {
    group := input.user.groups[_]
    group == "solution-engineer"
    tool := input.tool.name
    tool in {"approve_tool_access_request"}
}
