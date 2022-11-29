from tests.testing import BaseTestAgents

# NOTE: This is part of dev dependencies
# noinspection PyPackageRequirements
import pytest


class TestForbidden(BaseTestAgents):
    def setup_method(self) -> None:
        BaseTestAgents.setup_method(self)

    @pytest.mark.skip(reason="Coming soon.")
    def test_probabilities(self) -> None:
        raise NotImplementedError
