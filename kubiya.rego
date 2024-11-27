package kubiya.tool_manager

# Default deny all access
default allow = false

allow {
    input.tool.name == "request_tool_access" 
    or input.tool.name == "describe_access_request" 
    or input.tool.name == "search_access_requests" 
    or input.tool.name == "list_active_access_requests" 
    or input.tool.name == "github_pipeline_diagnostic" 
    or input.tool.name == "cluster_health"
}
allow {
    group := input.user.groups[_]
    group == "solution-engineer"
    input.tool.name == "approve_tool_access_request"
}
