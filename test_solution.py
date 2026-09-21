import unittest
from solution import XDAConceptEntityWithRouting

class TestXDAConceptEntityWithRouting(unittest.TestCase):
    def test_sub_streams(self):
        xda_entity = XDAConceptEntityWithRouting(["local-ai", "self-hosting", "diy-hardware", "deals"])
        self.assertEqual(xda_entity.get_sub_streams(), ["local-ai", "self-hosting", "diy-hardware", "deals"])

    def test_routing_behavior(self):
        xda_entity = XDAConceptEntityWithRouting(["local-ai", "self-hosting", "diy-hardware", "deals"])
        routing_behavior = xda_entity.get_routing_behavior()
        self.assertEqual(len(routing_behavior), 4)
        self.assertEqual(routing_behavior[0].get_sub_stream(), "local-ai")
        self.assertEqual(routing_behavior[0].get_priority(), 3)
        self.assertEqual(routing_behavior[1].get_sub_stream(), "self-hosting")
        self.assertEqual(routing_behavior[1].get_priority(), 3)
        self.assertEqual(routing_behavior[2].get_sub_stream(), "diy-hardware")
        self.assertEqual(routing_behavior[2].get_priority(), 2)
        self.assertEqual(routing_behavior[3].get_sub_stream(), "deals")
        self.assertEqual(routing_behavior[3].get_priority(), 1)

if __name__ == "__main__":
    unittest.main()