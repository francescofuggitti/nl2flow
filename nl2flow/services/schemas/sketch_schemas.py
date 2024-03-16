from __future__ import annotations
from typing import List, Optional, Union
from pydantic import BaseModel


class Parameter(BaseModel):
    name: str
    value: str


class Goal(BaseModel):
    item: str
    parameters: List[Parameter] = []


class Disjunction(BaseModel):
    OR: List[Goal]


class Ordering(BaseModel):
    order: str


class Condition(BaseModel):
    condition: str
    if_outcomes: List[Union[Goal, Condition, Disjunction, Ordering]] = []
    else_outcomes: List[Union[Goal, Condition, Disjunction, Ordering]] = []


class Mapping(BaseModel):
    source: str
    target: str
    goodness: float = 1.0


class Slot(BaseModel):
    name: str
    goodness: float = 1.0


class Sketch(BaseModel):
    sketch_name: str
    utterances: List[str] = []
    options: List[str] = []
    components: List[Union[Goal, Condition, Disjunction, Ordering]] = []
    mappings: List[Mapping] = []
    slots: List[Slot] = []


class Signature(BaseModel):
    name: str
    type: Optional[str] = None


class Constraint(BaseModel):
    constraint: str
    variables: List[Signature] = []
    evaluate: str


class Agent(BaseModel):
    id: str
    inputs: List[Union[Signature, Constraint]] = []
    outputs: List[Union[Signature, Constraint]] = []


class Catalog(BaseModel):
    catalog_name: str
    agents: List[Agent] = []
