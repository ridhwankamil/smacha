{% block meta %}
name: Utils
description: SMACH template containing macros commonly used by other templates.
language: Python
framework: SMACH
type: None
tags: [core]
includes: []
extends: []
variables: []
input_keys: []
output_keys: []
{% endblock meta %}

#
# Macro for rendering 'userdata' state machine headers.
#
{% macro render_userdata(namespace, userdata) %}
{% for userdatum_key, userdatum_val in userdata.items() | sort %}
{{ namespace | lower() }}.userdata.{{ userdatum_key | lower() }} = {% if userdatum_val is not_string %}{{ userdatum_val }}{% else %}'{{ userdatum_val }}'{% endif %}
{% endfor %}
{% endmacro %}

#
# Macro for rendering 'outcomes' in state instantiations.
#
{% macro render_outcomes(outcomes, indent=0) %}{{ 'outcomes=' | indent(indent, true) }}[{% for outcome in outcomes %}'{{ outcome }}'{% if not loop.last %}, {% endif %}{% endfor %}]{% endmacro %}

#
# Macro for rendering 'input_keys' in state instantiations.
#
{% macro render_input_keys(input_keys, indent=37) %}{{ 'input_keys = ' | indent(indent, true) }}[{% for input_key in input_keys %}'{{ input_key }}'{% if not loop.last %}, {% endif %}{% endfor %}]{% endmacro %}

#
# Macro for rendering 'output_keys' in state instantiations.
#
{% macro render_output_keys(output_keys, indent=37) %}{{ 'output_keys = ' | indent(indent, true) }}[{% for input_key in output_keys %}'{{ input_key }}'{% if not loop.last %}, {% endif %}{% endfor %}]{% endmacro %}

#
# Macro for rendering 'goal_slots' in state instantiations.
#
{% macro render_goal_slots(goal_slots, indent=51) %}{{ 'goal_slots = ' | indent(indent, true) }}[{% for goal_slot in goal_slots %}'{{ goal_slot }}'{% if not loop.last %}, {% endif %}{% endfor %}]{% endmacro %}

#
# Macro for rendering 'result_slots' in state instantiations.
#
{% macro render_result_slots(result_slots, indent=51) %}{{ 'result_slots = ' | indent(indent, true) }}[{% for result_slot in result_slots %}'{{ result_slot }}'{% if not loop.last %}, {% endif %}{% endfor %}]{% endmacro %}

#
# Macro for rendering 'request_slots' in state instantiations.
#
{% macro render_request_slots(request_slots, indent=51) %}{{ 'request_slots = ' | indent(indent, true) }}[{% for request_slot in request_slots %}'{{ request_slot }}'{% if not loop.last %}, {% endif %}{% endfor %}]{% endmacro %}

#
# Macro for rendering 'response_slots' in state instantiations.
#
{% macro render_response_slots(response_slots, indent=51) %}{{ 'response_slots = ' | indent(indent, true) }}[{% for response_slot in response_slots %}'{{ response_slot }}'{% if not loop.last %}, {% endif %}{% endfor %}]{% endmacro %}

#
# Macro for rendering 'outcome_map' in state instantiations.
#
{% macro render_outcome_map(outcome_map, indent=35) %}{{ 'outcome_map=' | indent(indent, true) }}{{ '{' }}{% for outcome_map_key, outcome_map_val in outcome_map.items() | sort %}{% if outcome_map_val is mapping %}'{{ outcome_map_key }}': {{ '{' }} {% for outcome_map_sub_key, outcome_map_sub_val in outcome_map_val.items() | sort %}'{{ outcome_map_sub_key }}': '{{ outcome_map_sub_val }}'{% if not loop.last %}, {% endif %}{% endfor %}{{ '}' }}{% else %}'{{ outcome_map_key }}': '{{ outcome_map_val }}'{% endif %}{% if not loop.last %},
{{ '' | indent(indent+13, true) }}{% endif %}{% endfor %}{{ '}' }}{% endmacro %}

#
# Macro for rendering 'transitions' in state machine add() methods.
#
{% macro render_transitions(transitions, indent=23) %}{{ 'transitions=' | indent(indent, true) }}{{ '{' }}{% for outcome, transition in transitions.items() | sort %}'{{ outcome }}':'{{ transition }}'{% if not loop.last %},
{{ '' | indent(indent+13, true) }}{% endif %}{% endfor %}{{ '}' }}{% endmacro %}

#
# Macro for rendering 'remapping' in state machine add() methods.
#
{% macro render_remapping(remapping, indent=23) %}{{ 'remapping=' | indent(indent, true) }}{{ '{' }}{% for state_key, userdata_key in remapping.items() | sort %}'{{ state_key }}':'{{ userdata_key }}'{% if not loop.last %},
{{ '' | indent(indent+11, true) }}{% endif %}{% endfor %}{{ '}' }}{% endmacro %}

#
# Macro for importing std_msg types.
#
{% macro import_std_msg(defined_headers, type) %}
{% if 'std_msgs_msg_import_' + type not in defined_headers %}
from std_msgs.msg import {{ type }}
{% do defined_headers.append('std_msgs_msg_import_' + type) %}
{% endif %}{% endmacro %}

#
# Macro for importing geometry_msg types.
#
{% macro import_geometry_msg(defined_headers, type) %}
{% if 'geometry_msgs_msg_import_' + type not in defined_headers %}
from geometry_msgs.msg import {{ type }}
{% do defined_headers.append('geometry_msgs_msg_import_' + type) %}
{% endif %}{% endmacro %}

#
# Macro for importing sensor_msg types.
#
{% macro import_sensor_msg(defined_headers, type) %}
{% if 'sensor_msgs_msg_import_' + type not in defined_headers %}
from sensor_msgs.msg import {{ type }}
{% do defined_headers.append('sensor_msgs_msg_import_' + type) %}
{% endif %}{% endmacro %}
