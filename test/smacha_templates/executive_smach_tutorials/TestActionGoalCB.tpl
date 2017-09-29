{% extends "SimpleActionState.tpl" %}

{% block imports %}
{% if 'smacha_msg_import_TestAction' not in defined_headers %}
from smacha.msg import TestAction
{% do defined_headers.append('smacha_msg_import_TestAction') %}
{% endif %}
{% if 'smacha_msg_import_TestGoal' not in defined_headers %}
from smacha.msg import TestGoal
{% do defined_headers.append('smacha_msg_import_TestGoal') %}
{% endif %}
{{ super() }}
{% endblock imports %}

{% block header %}
{% endblock header %}

{% block body %}
# Add another simple action state. This will give a goal
# that should abort the action state when it is received, so we
# map 'aborted' for this state onto 'succeeded' for the state machine.
def goal_callback(userdata, default_goal):
    goal = TestGoal()
    goal.goal = 2
    return goal
{{ super() }}
{% endblock body %}
