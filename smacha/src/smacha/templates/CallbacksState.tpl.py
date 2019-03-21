{% block meta %}
name: CallbacksState
description: SMACH state that defines callbacks that operate on userdata.
language: Python
framework: SMACH
type: State
tags: [core]
includes:
  - State
extends: []
variables:
- callbacks:
    description: A list of callback functions (e.g. lambda functions).
    type: list of function
input_keys: []
output_keys: []
outcomes:
- succeeded
{% endblock meta %}

{% from "Utils.tpl.py" import render_init_callbacks, render_execute_callbacks %}

{% extends "State.tpl.py" %}

{% block class_defs %}
{{ super() }}
{% if 'class_CallbacksState' not in defined_headers %}
class CallbacksState(smach.State):
    def __init__(self, input_keys = [], output_keys = [], callbacks = []):
        smach.State.__init__(self, input_keys=input_keys, output_keys=output_keys, outcomes=['succeeded'])

        {{ render_init_callbacks() }}

    def execute(self, userdata):

        {{ render_execute_callbacks() }}

        return 'succeeded'
{% do defined_headers.append('class_CallbacksState') %}{% endif %}
{% endblock class_defs %}
