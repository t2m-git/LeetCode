class Solution(object):
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        
        dict = {}
        
        for index, num in enumerate(nums):
            
            if target - num in dict:
                return [dict[target - num], index]
                
            dict[num] = index
