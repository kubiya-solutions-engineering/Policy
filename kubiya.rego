# Default deny all access
default allow = false

# List of admin-only functions (functions that ONLY admin can run)
admin_only_functions = {
    "list_active_access_requests",
    "search_access_requests",
    "approve_tool_access_request",
    "store_request"
}

# List of restricted tools (nobody can run these)
restricted_tools = {
    "jit_session_grant_view_access_to_march17test2",
    "jit_session_grant_view_access_to_kubiyamichaelg",
    "jit_session_grant_veranatest_access_to_kubiyamichaelg",
    "s3_grant_data_lake_read",
    "jit_session_revoke_view_access_to_march17test2",
    "jit_session_revoke_view_access_to_kubiyamichaelg",
    "jit_session_revoke_veranatest_access_to_kubiyamichaelg",
    "s3_revoke_data_lake_read"
}

# Allow Administrators to run admin_only functions
allow {
    group := input.user.groups[_].name
    group == "solution-engineer"
    admin_only_functions[input.tool.name]
}

# Allow everyone to run everything except admin functions and restricted tools
allow {
    not restricted_tools[input.tool.name]
    not admin_only_functions[input.tool.name]
}
