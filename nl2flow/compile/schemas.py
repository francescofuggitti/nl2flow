from __future__ import annotations
from nl2flow.compile.utils import string_transform, Transform
from nl2flow.compile.options import TypeOptions, CostOptions, GoalType, MemoryState
from typing import Set, List, Optional, Union, Tuple
from pydantic import BaseModel


class MappingItem(BaseModel):
    source_name: str
    target_name: str
    probability: int


class MemoryItem(BaseModel):
    item_id: str
    item_type: Optional[str]
    item_state: MemoryState = MemoryState.UNKNOWN


class Constraint(BaseModel):
    constraint_id: str
    parameters: Set[str]
    truth_value: Optional[bool]


class GoalItem(BaseModel):
    goal_name: str
    goal_type: GoalType = GoalType.OPERATOR


class GoalItems(BaseModel):
    goals: Union[GoalItem, Constraint, List[Union[GoalItem, Constraint]]]


class SignatureItem(BaseModel):
    parameters: Set[Union[str, MemoryItem]]
    constraints: List[Constraint] = []


class Outcome(BaseModel):
    conditions: List[SignatureItem] = []
    outcomes: List[SignatureItem] = []
    probability: Optional[float]


class PartialOrder(BaseModel):
    antecedent: str
    precedent: str


class TypeItem(BaseModel):
    name: str
    parent: str = TypeOptions.ROOT.value
    children: Union[str, Set[str]] = set()


class OperatorDefinition(BaseModel):
    name: str
    cost: int = CostOptions.UNIT.value
    inputs: List[SignatureItem] = []
    outputs: Union[Outcome, List[Outcome]] = []


class PDDL(BaseModel):
    domain: str
    problem: str


class FlowDefinition(BaseModel):
    name: str
    operators: List[OperatorDefinition] = []
    type_hierarchy: List[TypeItem] = []
    memory_items: List[MemoryItem] = []
    constraints: List[Constraint] = []
    partial_orders: List[PartialOrder] = []
    list_of_mappings: List[MappingItem] = []
    goal_items: List[GoalItems] = []
    starts_with: Optional[str]
    ends_with: Optional[str]

    @classmethod
    def transform(cls, flow: FlowDefinition) -> Tuple[FlowDefinition, Transform]:
        new_flow = FlowDefinition(name=flow.name)
        transforms: List[Transform] = list()

        if flow.starts_with:
            new_flow.starts_with = string_transform(flow.starts_with)

        if flow.ends_with:
            new_flow.ends_with = string_transform(flow.ends_with)

        return flow, transforms
