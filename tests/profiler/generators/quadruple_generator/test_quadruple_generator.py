import unittest
from nl2flow.compile.flow import Flow
from nl2flow.compile.operators import ClassicalOperator as Operator
from nl2flow.plan.planners import Michael, Christian
from nl2flow.plan.options import DEFAULT_PLANNER_URL
from nl2flow.compile.schemas import SignatureItem, GoalItem, GoalItems
from profiler.test_helpers.profiler_test_helper import write_pddl_plan
import os

PLANNER_URL = os.getenv("PLANNER_URL")
PLANNER = (
    Michael(url=PLANNER_URL)
    if PLANNER_URL is not None
    else Christian(url=DEFAULT_PLANNER_URL)
)


class TestQuadrupleGenerator(unittest.TestCase):
    def test_basic_quadruple(self) -> None:
        """
        THIS IS A TEST DESCRIPTION line 1
        THIS IS A TEST DESCRIPTION line 2
        THIS IS A TEST DESCRIPTION line 3
        THIS IS A TEST DESCRIPTION line 4
        THIS IS A TEST DESCRIPTION line 5
        """
        new_flow = Flow("Basic Test")

        find_errors_api = Operator("Find Errors")
        find_errors_api.add_input(SignatureItem(parameters=["database link"]))
        find_errors_api.add_output(SignatureItem(parameters=["list of errors"]))

        fix_errors_api = Operator("Fix Errors")
        fix_errors_api.add_input(SignatureItem(parameters=["list of errors"]))

        new_flow.add([find_errors_api, fix_errors_api])

        goal = GoalItems(goals=GoalItem(goal_name="Fix Errors"))
        new_flow.add(goal)

        pddl, _ = new_flow.compile_to_pddl()
        plans = new_flow.plan_it(PLANNER)
        write_pddl_plan(pddl, plans, PLANNER)
        assert True
