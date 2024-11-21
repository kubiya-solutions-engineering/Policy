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

# Special access for cluster_health tool
allow {
    input.tool.name == "jit_session_grant_view_access_to_march17test2"
    input.user.email == "kubiyamg@gmail.com"
}

# PDB checker access for solution-engineer team
allow {
    input.tool.name == "pod_disruption_budget_checker"
    group := input.user.groups[_]
    namespace := input.tool.parameters.namespace

    # Fixed typos in group name and namespace
    namespace == "all"
    group == "solution-engineer"
}

# PDB checker access for specific user
allow {
    input.tool.name == "pod_disruption_budget_checker"
    input.user.email == "kris.talajic@kubiya.ai"
    input.tool.parameters.namespace == "all"
}

# Helper function to check if tool is restricted
is_restricted(tool) {
    restricted_tools := {"cluster_health"}
    restricted_tools[tool]
}
