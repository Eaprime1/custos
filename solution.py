# Import necessary libraries
from typing import List

# Define the concept entity for XDA with four named sub-streams
class XDAConceptEntity:
    def __init__(self, sub_streams: List[str]):
        self.sub_streams = sub_streams

    def get_sub_streams(self) -> List[str]:
        return self.sub_streams

# Define the routing behavior for each sub-stream
class RoutingBehavior:
    def __init__(self, sub_stream: str, priority: int):
        self.sub_stream = sub_stream
        self.priority = priority

    def get_sub_stream(self) -> str:
        return self.sub_stream

    def get_priority(self) -> int:
        return self.priority

# Define the concept entity with routing behavior
class XDAConceptEntityWithRouting:
    def __init__(self, sub_streams: List[str]):
        self.sub_streams = sub_streams
        self.routing_behavior = self._create_routing_behavior()

    def _create_routing_behavior(self) -> List[RoutingBehavior]:
        return [
            RoutingBehavior("local-ai", 3),
            RoutingBehavior("self-hosting", 3),
            RoutingBehavior("diy-hardware", 2),
            RoutingBehavior("deals", 1)
        ]

    def get_sub_streams(self) -> List[str]:
        return self.sub_streams

    def get_routing_behavior(self) -> List[RoutingBehavior]:
        return self.routing_behavior

# Example usage
if __name__ == "__main__":
    xda_entity = XDAConceptEntityWithRouting(["local-ai", "self-hosting", "diy-hardware", "deals"])
    print(xda_entity.get_sub_streams())
    print(xda_entity.get_routing_behavior())